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
 after_create :user_has_video
 before_destroy :user_does_not_have_video
 validates  :user_id, presence: true
 validates  :question, presence: true
 validates  :video_cid, :presence => {:message => "does not look to be saved. Please record and save your video."}

 private

  def user_has_video
    self.user.has_video = true
    self.user.save!
  end

  def user_does_not_have_video
    self.user.has_video = false
    self.user.save!
  end


end

