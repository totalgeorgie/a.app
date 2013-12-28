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
#

require 'spec_helper'

describe Answer do
  pending "add some examples to (or delete) #{__FILE__}"
end
