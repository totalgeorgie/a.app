# == Schema Information
#
# Table name: user_industry_relations
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  industry_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class UserIndustryRelation < ActiveRecord::Base
  belongs_to :user 
  belongs_to :industry
end
