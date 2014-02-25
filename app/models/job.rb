# == Schema Information
#
# Table name: jobs
#
#  id                 :integer          not null, primary key
#  job_title          :string(255)
#  job_summary        :string(255)
#  qualifications     :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  applications_count :integer

class Job < ActiveRecord::Base
  default_scope { order('jobs.created_at DESC') }
  validates :job_title, presence: true 
  validates :job_summary, presence: true
  validates :qualifications, presence: true 

  has_many :bullets, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :questions, dependent: :destroy
  
  has_many :job_city_relations, dependent: :destroy 
  has_many :cities, through:  :job_city_relations
  has_many :job_industry_relations, dependent: :destroy
  has_many :industries, through:  :job_industry_relations
  has_many :job_position_relations, dependent: :destroy
  has_many :positions, through:  :job_position_relations
  has_many :applications, dependent: :destroy
  has_many :users, through:  :applications

  accepts_nested_attributes_for :bullets, 
    reject_if:  lambda { |data| data[:bullet].blank? }, 
    allow_destroy:  true

  accepts_nested_attributes_for :roles,
    reject_if:  lambda { |data| (data[:role_title].blank? || data[:role_desc].blank?) }, 
    allow_destroy:  true
  
  accepts_nested_attributes_for :questions, 
    reject_if: lambda { |data| data[:content].blank? },
    allow_destroy:  true

  def self.search(params)
    city_id = Integer(params[:city_id]) if params[:city_id]
    jobs = Job.includes(:cities, :industries)
    jobs = jobs.where("cities.id = ?", city_id).references(:cities) if city_id
    jobs
  end
end
