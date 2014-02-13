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
  after_create :user_video
  before_destroy :user_video
  belongs_to :user
  validates  :user_id, presence: true
  validates  :video_uuid, :presence => {:message => "does not look to be saved. Please record and save your video."}

  private
  def user_video
    user.toggle!(:has_video)
    user.common_app.set_progress
  end
end

