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
 
 has_many :common_app_industry_relations
 has_many :industries, :through => :common_app_industry_relations

 has_many :common_app_city_relations
 has_many :cities, :through => :common_app_city_relations

 has_many :common_app_position_relations
 has_many :positions, :through => :common_app_position_relations

end

