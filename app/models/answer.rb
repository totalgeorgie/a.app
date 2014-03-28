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
  validate :has_correct_question

  private
  def has_correct_question
    self.application.question_ids.include?(self.question_id)
  end
end
