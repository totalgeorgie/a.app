# == Schema Information
#
# Table name: job_ideals
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  job_id     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class JobIdeal < ActiveRecord::Base
  belongs_to :job	
  validates :content, presence: true
end
