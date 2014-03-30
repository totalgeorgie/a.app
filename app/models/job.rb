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
#  hit_count          :integer          default(0)
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
  has_many :applications, inverse_of: :job, dependent: :destroy
  has_many :users,  through: :applications

  validates :cities, 
    :job_title,
    :job_summary,
    :qualifications,
    :industries,
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
      .includes(:questions)
      .includes(:bullets)
      .includes(:roles)
    
    job = job.where(cities: { id: city })  if city 

    job
  end

  scope :with_search, ->(search) do
    job = Job.includes(:industries)
      .includes(:cities)
      .includes(:bullets)
      .includes(:roles)
      .includes(:questions)

    if search
      job = job.where('jobs.job_title LIKE ?', "%#{search}%")
    end

    job
  end

  scope :with_info, -> do
    Job.includes(:industries)
       .includes(:cities)
       .includes(:bullets)
       .includes(:roles)
       .includes(:questions)
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

  def potentials
    User.includes(:source, :heat, :jobs, common_app: [:cities, :industries]) 
      .where('cities.id IN (?)', self.city_ids)
      .where('industries.id IN (?)', self.industry_ids)
      .where('applications.id NOT IN (?) OR ? = 0', self.applications.map(&:id), self.applications.length)
      .order('common_apps.progress DESC')
  end
end
