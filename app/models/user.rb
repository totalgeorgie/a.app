# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  password_digest        :string(255)
#  remember_token         :string(255)
#  admin                  :boolean          default(FALSE)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  heat_id                :integer          default(2)
#  admin_note             :string(255)
#  progress               :integer          default(5)
#  applications_count     :integer
#  source_id              :integer
#

class User < ActiveRecord::Base
  #remove has_video
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  default_scope { order('users.id DESC') } 
  
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  after_create :create_common_app

  belongs_to :heat
  belongs_to :source
  has_one :common_app, dependent: :destroy, inverse_of: :user
  has_many :cities, through: :common_app
  has_many :positions, through: :common_app
  has_one :video, inverse_of: :user, dependent: :destroy
  has_many :applications, dependent: :destroy
  has_many :jobs, through: :applications

  has_secure_password validations: false
  validates :name, presence: true,
   length: { maximum: 50 }
  validates :email, presence: true, 
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false } 
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :password, presence: true, on: :create

  scope :with_dependents, -> do
    User.includes(:common_app)
      .includes(:video)
      .includes(:applications)
      .includes(:jobs)
  end 

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def generate_token(column) 
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
  
  private   
  def create_common_app
    self.build_common_app
  end
  
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
