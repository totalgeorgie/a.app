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
#  admin_note             :text(800)
#  applications_count     :integer
#  admin_link             :string(255)
#  sourced                :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  default_scope { order('users.id DESC') } 
  
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  before_create :ensure_common_app
  before_create :ensure_admin_link

  has_one  :common_app, dependent: :destroy, inverse_of: :user
  has_one  :video, inverse_of: :user, dependent: :destroy
  has_one  :extra_info, inverse_of: :user, dependent: :destroy
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

  accepts_nested_attributes_for :extra_info, 
    reject_if:  :all_blank, 
    allow_destroy:  true

  scope :proactive, -> { where(sourced: false) }
  scope :sourced, -> { where(sourced: true) }

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
  
  scope :search, ->(opts) do
    users = User.includes(common_app: [:cities, :industries])
    users = users.where('users.name LIKE ?', "%#{opts[:name]}%") if works(opts[:name])
    users = users.where('cities.id IN (?)', opts[:city_ids]) if works(opts[:city_ids])
    users = users.where('industries.id IN (?)', opts[:industry_ids]) if works(opts[:industry_ids])
    users = users.where('common_apps.grad_year >= ?', opts[:grad_year_start].to_i) if works(opts[:grad_year_start])
    users = users.where('common_apps.grad_year <= ?', opts[:grad_year_end].to_i) if works(opts[:grad_year_end])
    users = users.where('common_apps.has_video = ?', true) if works(opts[:has_video])
    users = users.where('users.sourced = ?', true) if works(opts[:sourced])
    users
  end

  def potential_jobs
    Job.includes(:cities, :industries)
      .where('cities.id IN (?)', self.common_app.city_ids)
      .where('industries.id IN (?)', self.common_app.industry_ids)
      .where('jobs.id NOT IN (?)', self.jobs.map(&:id).concat([0]))
  end

  def self.works(param)
    !param.blank?
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

  def last_name
    self.name.split(" ").last
  end
  
  def generate_email
    email_tag = "#{self.first_name}-#{self.last_name}-#{Time.now.to_date.to_s}"
    self.email = "#{email_tag}@atlas-china.com"

    self
  end
  
  def generate_pass
    self.password = ("a".."z").to_a.sample(8).join("")

    self
  end

  def generate_token(column) 
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def generate_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save! 

    self.password_reset_token
  end
  
  def send_password_reset
    generate_password_reset
    UserMailer.password_reset(self).deliver
  end
  
  private
  def ensure_common_app 
    self.common_app || self.build_common_app
  end
  
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

  def ensure_admin_link
    self.generate_token(:admin_link)
  end
end
