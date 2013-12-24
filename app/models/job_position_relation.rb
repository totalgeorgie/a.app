# == Schema Information
#
# Table name: job_position_relations
#
#  id          :integer          not null, primary key
#  job_id      :integer
#  position_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class JobPositionRelation < ActiveRecord::Base
  belongs_to :job
  belongs_to :position
end
