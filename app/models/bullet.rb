# == Schema Information
#
# Table name: bullets
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  bullet     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Bullet < ActiveRecord::Base
	belongs_to :job
	validates :job_id, presence: true
	validates :bullet, presence: true
end
