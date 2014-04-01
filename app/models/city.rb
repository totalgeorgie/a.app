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
  has_many :common_app_city_relations, :dependent => :destroy 
  has_many :common_apps, :through => :common_app_city_relations
  has_many :job_city_relations, :dependent => :destroy 
  has_many :jobs, :through => :job_city_relations

  def self.preload
    City.select(:id, :name).all.map{ |cit| { id: cit.id.to_s, name: cit.name } }
  end
end
