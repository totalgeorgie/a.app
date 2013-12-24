class CommonAppCityRelation < ActiveRecord::Base
  belongs_to :common_app
  belongs_to :city
end
