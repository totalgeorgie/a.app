# == Schema Information
#
# Table name: common_app_industry_relations
#
#  id            :integer          not null, primary key
#  common_app_id :integer
#  industry_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class CommonAppIndustryRelation < ActiveRecord::Base
  belongs_to :common_app
  belongs_to :industry
end