# == Schema Information
#
# Table name: jobs
#
#  id                 :integer          not null, primary key
#  job_title          :text(500)
#  job_summary        :text(500)
#  qualifications     :text(1000)
#  created_at         :datetime
#  updated_at         :datetime
#  applications_count :integer
#  hit_count          :integer          default(0)
#

require 'spec_helper'

describe Job do
  pending "add some examples to (or delete) #{__FILE__}"
end
