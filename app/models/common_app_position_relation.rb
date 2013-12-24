class CommonAppPositionRelation < ActiveRecord::Base
  belongs_to :common_app
  belongs_to :position
end
