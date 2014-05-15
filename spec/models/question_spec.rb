# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  created_at :datetime
#  updated_at :datetime
#  content    :text(500)
#

require 'spec_helper'

describe Question do
  pending "add some examples to (or delete) #{__FILE__}"
end
