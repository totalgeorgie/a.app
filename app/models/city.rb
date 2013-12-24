# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class City < ActiveRecord::Base
  has_many :user_city_relations 
  has_many :users, :through => :user_city_relations

  has_many :job_city_relations 
  has_many :jobs, :through => :job_city_relations 
end
