# == Schema Information
#
# Table name: user_position_relations
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  position_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class UserPositionRelation < ActiveRecord::Base
end
