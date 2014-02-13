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
  after_save :set_progress 

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
    attribute_names.each do |attr|
     total_completed += 1 unless self[attr].blank?
    end

    total_completed = total_completed - 3
    # +1 name
    # -4 for id,  created_at, updated_at, user_id 
    total_completed += 1 if cities.any?
    total_completed += 1 if positions.any?
    total_completed += 1 if industries.any?
    total_completed += 2 if user.has_video

    (100.0*total_completed/total_questions).round
  end

  def set_progress
    current_progress = self.progress
    unless self.user.progress == current_progress 
      self.user.progress = current_progress
      self.user.save!
    end
  end
end

