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
 after_save :set_progress 
 after_create :set_customerio
 after_destroy :set_customerio

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

  def set_progress
   current_progress = self.user.common_app.progress
   unless self.user.progress == current_progress 
      self.user.progress = current_progress
      self.user.save!
   end
  end
  
  def set_customerio
    user = self.user
    $customerio.identify(
      id: user.id,
      video: !user.video.nil?,
    )
  end

end

