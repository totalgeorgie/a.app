# == Schema Information
#
# Table name: answers
#
#  id             :integer          not null, primary key
#  application_id :integer
#  question_id    :integer
#  created_at     :datetime
#  updated_at     :datetime
#  content        :text(1000)
#  video_uuid     :string(255)
#

class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :application
end
