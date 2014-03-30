# == Schema Information
#
# Table name: applications
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  job_id      :integer
#  created_at  :datetime
#  updated_at  :datetime
#  shortlisted :boolean          default(FALSE)
#  status      :string(255)      default("SENT")
#

require 'spec_helper'

describe Application do
  pending "add some examples to (or delete) #{__FILE__}"
end
