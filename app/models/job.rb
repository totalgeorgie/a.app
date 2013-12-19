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

    has_many :bullets, :dependent => :destroy
    has_many :roles, :dependent => :destroy

    accepts_nested_attributes_for :bullets, :reject_if => lambda { |a| a[:bullet].blank? }, :allow_destroy => true
    accepts_nested_attributes_for :roles, :reject_if => lambda { |a| a[:role_title].blank? || a[:role_desc].blank? }, :allow_destroy => true
    	#lambda { |a| a[:bullet].blank? } makes sure that on edit, if a value is left blank, then it doesn't save it

end
