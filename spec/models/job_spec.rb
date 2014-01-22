# == Schema Information
#
# Table name: jobs
#
#  id                 :integer          not null, primary key
#  job_title          :string(255)
#  job_summary        :string(255)
#  qualifications     :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  applications_count :integer
#

require 'spec_helper'

describe Job do
  pending "add some examples to (or delete) #{__FILE__}"
end
