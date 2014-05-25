# == Schema Information
#
# Table name: bullets
#
#  id          :integer          not null, primary key
#  job_id      :integer
#  bullet      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  descriptive :boolean          default(FALSE)
#

class Bullet < ActiveRecord::Base
  belongs_to :job	
  validates :bullet, presence: true

  scope :descriptive, -> { where(descriptive: true) }
  scope :future, -> { where(descriptive: false) }
end
