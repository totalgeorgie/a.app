class CommonAppIndustryRelation < ActiveRecord::Base
  belongs_to :common_app
  belongs_to :industry
end
