# == Schema Information
#
# Table name: common_app_role_type_relations
#
#  id            :integer          not null, primary key
#  role_type_id  :integer
#  common_app_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class CommonAppRoleTypeRelation < ActiveRecord::Base
  belongs_to :common_app
  belongs_to :role_type
end
