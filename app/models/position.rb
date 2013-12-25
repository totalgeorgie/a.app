# == Schema Information
#
# Table name: positions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Position < ActiveRecord::Base
 has_many :common_app_positions_relations
 has_many :common_apps, :through => :common_app_position_relations
end
