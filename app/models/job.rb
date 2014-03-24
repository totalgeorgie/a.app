# == Schema Information
#
# Table name: jobs
#
#  id                 :integer          not null, primary key
#  job_title          :string(255)
#  job_summary        :text(500)
#  qualifications     :text(1000)
#  created_at         :datetime
#  updated_at         :datetime
#  applications_count :integer
#

class Job < ActiveRecord::Base
  default_scope { order('jobs.created_at DESC') }
  
  has_many :bullets, dependent: :destroy, inverse_of: :job
  has_many :roles, dependent: :destroy, inverse_of: :job
  has_many :questions, dependent: :destroy, inverse_of: :job
  
  has_many :job_city_relations, inverse_of: :job, dependent: :destroy 
  has_many :cities, through: :job_city_relations
  has_many :job_industry_relations, inverse_of: :job, dependent: :destroy
  has_many :industries, through: :job_industry_relations
  has_many :job_position_relations, inverse_of: :job, dependent: :destroy
  has_many :positions,  through: :job_position_relations
  has_many :applications, inverse_of: :job, dependent: :destroy
  has_many :users,  through: :applications

  validates :cities, 
    :job_title,
    :job_summary,
    :qualifications,
    :industries,
    :positions,
    :bullets, 
    :roles, 
    :questions, 
    presence: true

  accepts_nested_attributes_for :bullets, 
    reject_if:  :all_blank, 
    allow_destroy:  true

  accepts_nested_attributes_for :roles,
    reject_if: :all_blank, 
    allow_destroy:  true
  
  accepts_nested_attributes_for :questions, 
    reject_if: :all_blank,
    allow_destroy:  true

  scope :with_cities, ->(city) do
    job =  Job
      .includes(:industries)
      .includes(:cities)
      .includes(:bullets)
      .includes(:roles)
    
    job = job.where(cities: { id: city })  if city 

    job
  end

  scope :with_info, -> do
    Job.includes(:industries)
       .includes(:cities)
       .includes(:bullets)
       .includes(:roles)
  end

  def self.build
    job = Job.new
    
    2.times {
      job.bullets.build
      job.roles.build
    }  

    job.questions.build
    job
  end
end
