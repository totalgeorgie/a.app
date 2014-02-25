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
#  heat_id                :integer
#  admin_note             :string(255)
#  progress               :integer
#  applications_count     :integer
#  has_video              :boolean
#  source_id              :integer
#

class User < ActiveRecord::Base
  default_scope { order('users.id DESC') } 

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false } 
  has_secure_password validations: false
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :password, presence: true, on: :create

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  after_create :create_common_app
  after_save :set_customerio

  belongs_to :heat
  belongs_to :source

  has_one :common_app, dependent: :destroy
  
  has_many :cities, :through => :common_app
  has_many :positions, :through => :common_app
  
  has_one :video, dependent: :destroy
  
  has_many :applications, dependent: :destroy
  has_many :jobs, :through => :applications

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
  
  def first_name
    self.name.split(' ')[0].capitalize
  end

  def self.search(params)
    users = includes(:cities).includes(:positions)

    city_id = params[:city_id].to_i if params[:city_id] && params[:city_id].to_i != 0 
    position_id = params[:position_id].to_i if params[:position_id] && params[:position_id].to_i != 0 
    
    users = users.where("cities.id = ?", city_id).references(:cities) if city_id
    users = users.where("positions.id = ?", position_id).references(:positions) if position_id
    users = users.where('users.name LIKE ?', "%#{params[:search]}%") if params[:search]
    users
  end

  private   
  def create_common_app
    CommonApp.create!(user_id: id)
  end
  
  def set_customerio 
    $customerio.identify(id: id,
                        created_at: created_at,
                        email: email,
                        full_name: name,
                        progress:  progress,
                        video: has_video,
                        jobs_applied_to: applications_count
                      )
  end

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end
