# == Schema Information
#
# Table name: videos
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  video_uuid      :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  question_choice :string(255)
#

class Video < ActiveRecord::Base
  after_create :tell_common_app
  belongs_to :user
  has_one :common_app, through: :user

  validates  :user, presence: true
  validates  :video_uuid, presence: { message: "Please record and save your video." }

  private
  def tell_common_app
    self.common_app.has_video = true
    self.common_app.save!
  end
end

