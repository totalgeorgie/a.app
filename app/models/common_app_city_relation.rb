# == Schema Information
#
# Table name: common_app_city_relations
#
#  id            :integer          not null, primary key
#  common_app_id :integer
#  city_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class CommonAppCityRelation < ActiveRecord::Base
  belongs_to :common_app, counter_cache: :cities_count
  belongs_to :city
end
