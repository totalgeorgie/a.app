# == Schema Information
#
# Table name: job_industry_relations
#
#  id          :integer          not null, primary key
#  job_id      :integer
#  industry_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class JobIndustryRelation < ActiveRecord::Base
  belongs_to :job
  belongs_to :industry
end
