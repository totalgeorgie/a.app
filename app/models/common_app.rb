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
 validates :resume, presence: true
 mount_uploader :resume, ResumeUploader
 
 has_many :common_app_industry_relations, :dependent => :destroy 
 has_many :industries, :through => :common_app_industry_relations

 has_many :common_app_city_relations, :dependent => :destroy 
 has_many :cities, :through => :common_app_city_relations

 has_many :common_app_position_relations, :dependent => :destroy 
 has_many :positions, :through => :common_app_position_relations


 def progress
  total_questions = self.attribute_names.count - 1 # -4 for id, user_id, created_at, updated at + 3 for associations: cities,industries,positions
  total_answers = 0 
  self.attribute_names.each do |question|
   total_answers += 1 unless self.question.empty?
  end
  total_answers = total_answers - 4 # id, user_id, created_at, updated at
  total_answers += 1 if self.cities.any?
  total_answers += 1 if self.positions.any?
  total_answers += 1 if self.industries.any?
  
  total_answers / total_questions * 100
 end

end

