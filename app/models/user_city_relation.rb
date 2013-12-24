# == Schema Information
#
# Table name: user_city_relations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  city_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserCityRelation < ActiveRecord::Base
  belongs_to :user
  belongs_to :role 
end
