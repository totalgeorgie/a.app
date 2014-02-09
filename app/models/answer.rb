# == Schema Information
#
# Table name: answers
#
#  id             :integer          not null, primary key
#  application_id :integer
#  question_id    :integer
#  created_at     :datetime
#  updated_at     :datetime
#  content        :string(255)
#  video_uuid     :string(255)
#

class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :application
  validate :video_or_answer

  private
  def video_or_answer
    errors.add(:content, "You must either record a video or answer as text") if video_uuid.blank? && content.blank?
  end
end
