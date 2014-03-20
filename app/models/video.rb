# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  video_uuid :string(255)
#  question   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Video < ActiveRecord::Base
  belongs_to :user
  validates  :user, presence: true
  validates  :video_uuid, presence: {:message => "Please record and save your video."}
end

