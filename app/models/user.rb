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
#  told_admin             :boolean
#

class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  default_scope { order('users.id DESC') } 
  
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  before_create :ensure_common_app
  before_create :ensure_admin_link
  after_update  :tell_admin

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
  
  searchable do
    text    :name, :email, :admin_note
    date    :created_at 
    boolean :sourced
    
    boolean :has_video do
      common_app.try(:has_video)
    end

    text :current_city  do
      common_app.try(:current_city)
    end

    text :nationality do
      common_app.try(:nationality)
    end

    text :china_contrib do
      common_app.try(:china_contrib)
    end

    text :china_time do
      common_app.try(:china_time)
    end

    text :job_interest do
      common_app.try(:job_interest)
    end

    text :china_goals do
      common_app.try(:china_goals)
    end

    integer :grad_year do
      common_app.try(:grad_year)
    end

    integer :city_ids, multiple: true do
      common_app.try(:city_ids)
    end

    integer :industry_ids, multiple: true do
      common_app.try(:industry_ids)
    end

    integer :role_type_ids, multiple: true do
      common_app.try(:role_type_ids)
    end

    text :extra_info_education do
     extra_info.try(:education)
    end

    text :extra_info_experience_1 do
     extra_info.try(:experience_1)
    end

    text :extra_info_experience_2 do
     extra_info.try(:experience_2)
    end
  end

  def self.admin_search(opts)
    search = User.search do
      keywords opts[:name] if works(opts[:name])
      with(:city_ids, opts[:city_ids]) if works(opts[:city_ids])
      with(:industry_ids, opts[:industry_ids]) if works(opts[:industry_ids])
      with(:grad_year, grad_year_range(opts)) if works(grad_year_range(opts))
      with(:has_video, true) if works(opts[:has_video])
      with(:sourced, true) if works(opts[:sourced])
      order_by(:created_at, :desc)
      paginate(page: opts[:page], per_page: 30)
    end

    search.results
  end

  def self.grad_year_range(opts)
    year_start, year_end = opts[:grad_year_start], opts[:grad_year_end]
    works(year_start) && works(year_end) ? (year_start..year_end) : nil
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

  def potential_jobs
    Job.includes(:cities, :industries)
      .where('cities.id IN (?)', common_app.city_ids)
      .where('industries.id IN (?)', common_app.industry_ids)
      .where('jobs.id NOT IN (?)', jobs.map(&:id).concat([0]))
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

  def tell_admin
    if should_tell_admin?
      UserMailer.tell_admin_about(self).deliver
      self.toggle!(:told_admin)
    end
  end

  def should_tell_admin?
    !self.told_admin? && !self.sourced? && self.common_app.progress > 40
  end
end