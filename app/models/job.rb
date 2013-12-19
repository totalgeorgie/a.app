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

    has_many :bullets, dependent: :destroy 
    has_many :roles, dependent: :destroy
end
