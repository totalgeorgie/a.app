# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  role_title :string(255)
#  role_desc  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
	belongs_to :job

	validates :job_id, presence: true
	validates :role_title, presence: true
	validates :role_desc, :presence: true
end
