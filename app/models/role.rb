# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  role_title :text(500)
#  role_desc  :text(1000)
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
	belongs_to :job

	validates :role_title, presence: true
	validates :role_desc,  presence: true
end
