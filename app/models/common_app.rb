# == Schema Information
#
# Table name: common_apps
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  current_city  :string(255)
#  grad_year     :integer
#  read_type     :string(255)
#  listen_speak  :string(255)
#  time_in_china :integer
#  cover_letter  :string(255)
#  resume        :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class CommonApp < ActiveRecord::Base
 belongs_to :user
 validates :user_id, presence: true
 mount_uploader :resume, ResumeUploader
 
 has_many :common_app_industry_relations, :dependent => :destroy 
 has_many :industries, :through => :common_app_industry_relations

 has_many :common_app_city_relations, :dependent => :destroy 
 has_many :cities, :through => :common_app_city_relations

 has_many :common_app_position_relations, :dependent => :destroy 
 has_many :positions, :through => :common_app_position_relations


 def progress
  total_questions = self.attribute_names.count + 2

  # +4 for name, cities,industries,positions
  # -4 for id,  created_at, updated_at, user_id 
  # +2 for video 

  total_completed = 0 
  
  self.attribute_names.each do |attr|
   total_completed += 1 unless self[attr].blank?
  end
  
  total_completed = total_completed - 3
  # +1 name
  # -4 for id,  created_at, updated_at, user_id 
  
  total_completed += 1 if self.cities.any?
  total_completed += 1 if self.positions.any?
  total_completed += 1 if self.industries.any?
  total_completed += 2 if self.user.video

  (100.0*total_completed/total_questions).round

 end

end

