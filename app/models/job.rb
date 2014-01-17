# == Schema Information
#
# Table name: jobs
#
#  id             :integer          not null, primary key
#  job_title      :string(255)
#  job_summary    :string(255)
#  qualifications :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Job < ActiveRecord::Base
  validates :job_title, presence: true 
  validates :job_summary, presence: true
  validates :qualifications, presence: true 
  default_scope { order('jobs.created_at DESC') }

  has_many :bullets, :dependent => :destroy
  has_many :roles, :dependent => :destroy

  has_many :questions, :dependent => :destroy
  
  accepts_nested_attributes_for :bullets, :reject_if => lambda { |a| a[:bullet].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :roles, :reject_if => lambda { |a| a[:role_title].blank? || a[:role_desc].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  #lambda { |a| a[:bullet].blank? } makes sure that on edit, if a value is left blank, then it doesn't save it

  has_many :job_city_relations, :dependent => :destroy 
  has_many :cities, :through => :job_city_relations

  has_many :job_industry_relations, :dependent => :destroy
  has_many :industries, :through => :job_industry_relations

  has_many :job_position_relations, :dependent => :destroy
  has_many :positions, :through => :job_position_relations

  has_many :applications, :dependent => :destroy
  has_many :users, :through => :applications

  def self.search(params)
    city = City.find(params[:city_id]) if params[:city_id] && params[:city_id] != "0"
    position = Position.find(params[:position_id]) if params[:position_id] && params[:position_id] != "0"
    jobs = Job.all
    jobs = jobs.includes(:cities).where(cities: { id: city }) if city
    jobs = jobs.includes(:positions).where(positions: { id: position }) if position
    jobs.paginate(page: params[:page], per_page: 5)
  end

end
