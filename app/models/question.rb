#
# Table name: questions
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  created_at :datetime
#  updated_at :datetime
#  content    :string(255)
#

class Question < ActiveRecord::Base
	belongs_to :job
	has_one :answer
	
end
