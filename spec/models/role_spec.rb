# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  role_title :text(500)
#  role_desc  :text(1000)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Role do
  pending "add some examples to (or delete) #{__FILE__}"
end
