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
#  admin_note             :text(800)
#  applications_count     :integer
#  source_id              :integer
#

class User < ActiveRecord::Base
  #remove has_video
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  default_scope { order('users.id DESC') } 
  
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  before_create :ensure_common_app

  belongs_to :heat
  belongs_to :source
  has_one :common_app, dependent: :destroy, inverse_of: :user
  has_one :video, inverse_of: :user, dependent: :destroy
  has_many :cities, through: :common_app
  has_many :industries, through: :common_app
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

  accepts_nested_attributes_for :common_app, 
    reject_if:  :all_blank, 
    allow_destroy:  true

  scope :with_dependents, -> do
    User.includes(:common_app)
      .includes(:video)
      .includes(:applications)
      .includes(:jobs)
  end

  scope :for_profile, -> do 
      User.includes(applications: :job)
      .includes(:video)
      .includes(common_app: [:cities, :industries])
  end

  def self.works(param)
    !param.blank?
  end
  
  def self.search(opts)
    users = User.includes(common_app: [:cities, :industries])
    users = users.where('users.name LIKE ?', "%#{opts[:name]}%") if works(opts[:name])
    users = users.where('cities.id = ?', opts[:city_id]) if works(opts[:city_id])
    users = users.where('industries.id = ?', opts[:industry_id]) if works(opts[:industry_id])
    users = users.where('common_apps.grad_year > ?', opts[:grad_year].to_i) if works(opts[:grad_year])
    users = users.where('common_apps.has_video = ?', true) if works(opts[:has_video])
    
    users
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def first_name
    self.name.split(" ").first
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
  def ensure_common_app 
    self.common_app || self.build_common_app
  end
  
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end