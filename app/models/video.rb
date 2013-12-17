# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  video_cid  :string(255)
#  question   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Video < ActiveRecord::Base
 belongs_to :user
 validates :user_id, presence: true
 # must create validates for the other form stuff. 
 
end

