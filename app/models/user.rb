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
#

class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  after_create :create_common_app
  after_create :set_heat_level

  after_save :set_customerio
  default_scope { order('users.created_at DESC') }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  			format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  
  has_secure_password validations: false
  
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :password, presence: true, on: :create

  belongs_to :heat

  has_one :common_app, dependent: :destroy
  has_many :cities, :through => :common_app
  has_many :positions, :through => :common_app

  has_one :video, dependent: :destroy

  has_many :applications, dependent: :destroy
  has_many :jobs, :through => :applications
  
  def create_common_app
    common_app = self.build_common_app
    common_app.save!
  end

  def set_heat_level
    self.heat_id = 3 # Id of normal 
    self.save!
  end


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column) # this is similar to create_remember_token, but instead it's generalized, so it can work on any column
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
  def beginner? 
    false if self.common_app || self.video || self.jobs.any?
  end

  def first_name
    self.name.split(' ')[0].capitalize
  end

  def self.search(params)
    city = City.find(params[:city_id]) if params[:city_id] && params[:city_id] != "0" && params[:city_id] != "" 
    position = Position.find(params[:position_id]) if params[:position_id] && params[:position_id] != "0" && params[:position_id] != "" 
    users = User.all
    users = users.includes(:cities).where(cities: { id: city }) if city
    users = users.includes(:positions).where(positions: { id: position }) if position
    users = users.where('users.name LIKE ?', "%#{params[:search]}%") if params[:search]
    users
  end
  
  private

    def set_customerio 
      user = self
      $customerio.identify(
        id: user.id,
        created_at: user.created_at,
        email: user.email,
        full_name: user.name,
        progress: user.progress,
        video: !user.video.nil?,
        jobs_applied_to: user.applications.length
      )
    end

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
