# == Schema Information
#
# Table name: common_app_position_relations
#
#  id            :integer          not null, primary key
#  common_app_id :integer
#  position_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class CommonAppPositionRelation < ActiveRecord::Base
  belongs_to :common_app
  belongs_to :position
end
