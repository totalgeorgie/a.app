# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
end
