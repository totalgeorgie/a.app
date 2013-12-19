# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  role_title :string(255)
#  role_desc  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Role do
  pending "add some examples to (or delete) #{__FILE__}"
end
