# == Schema Information
#
# Table name: applications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  job_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Application < ActiveRecord::Base
	belongs_to :job
	belongs_to :user
	validates :job_id, presence: true 
	validates :user_id, presence: true 
	has_many :answers
	accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
