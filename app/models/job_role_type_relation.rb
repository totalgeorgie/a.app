# == Schema Information
#
# Table name: job_role_type_relations
#
#  id           :integer          not null, primary key
#  role_type_id :integer
#  job_id       :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class JobRoleTypeRelation < ActiveRecord::Base
  belongs_to :job
  belongs_to :role_type
end