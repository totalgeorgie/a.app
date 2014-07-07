# == Schema Information
#
# Table name: common_apps
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  current_city     :string(255)
#  grad_year        :integer
#  resume           :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  industries_count :integer          default(0), not null
#  cities_count     :integer          default(0), not null
#  nationality      :string(255)
#  salary_pref      :integer          default(0)
#  china_contrib    :text(1000)
#  progress         :integer          default(5)
#  has_video        :boolean          default(FALSE)
#  china_time       :text(1000)
#  job_interest     :text(1000)
#  china_goals      :text(1000)
#  culture_pref     :integer          default(0)
#

class CommonApp < ActiveRecord::Base
  NOT_INCLUDED = 4 # id, created_at, updated_at, user_id
  
  GRAD_OPTIONS = (1993..Time.now.strftime('%Y').to_i).map(&:to_s)
  
  JOB_INTERESTS = ["Actively searching",
    "Open to the right opportunity",
    "Just want to see what's out there",
    "Not in the market"]
  
  before_update :set_progress
  after_update  :tell_admin

  belongs_to :user
  has_one  :video, through: :user

  has_many :common_app_role_type_relations, dependent: :destroy 
  has_many :role_types, through: :common_app_role_type_relations

  has_many :common_app_industry_relations, dependent: :destroy 
  has_many :industries, through: :common_app_industry_relations

  has_many :common_app_city_relations, dependent: :destroy 
  has_many :cities, through: :common_app_city_relations

  validates :user, presence: true
  mount_uploader :resume, ResumeUploader
  
  scope :with_dependents, -> do
    CommonApp.includes(:video)
      .includes(:industries)
      .includes(:cities)
  end

  def self.countries
    countries = Country::Data.map {|k,v| [k, v['name']]}.sort_by { |d| d[0] }
    Hash[*countries.flatten]
  end
  
  def calculate_progress
    total_questions = self.attribute_names.length - (NOT_INCLUDED + 1)
    total_completed = -NOT_INCLUDED

    attribute_names.each do |attr|
     total_completed += 1 if is_complete?(self[attr])
    end
    
    (100.0*total_completed/total_questions).round
  end

  def country_name
    self.class.countries[self.nationality]
  end

  private
  
  def set_progress
    current_progress = self.calculate_progress
    unless self.progress == current_progress 
      self.progress = current_progress
    end
  end

  def tell_admin
    user.tell_admin
  end
  
  def is_complete?(field)
    !field.blank? && field != 0
  end
end