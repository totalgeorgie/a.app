# == Schema Information
#
# Table name: common_apps
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  current_city     :string(255)
#  grad_year        :integer
#  resume           :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  industries_count :integer          default(0), not null
#  cities_count     :integer          default(0), not null
#  positions_count  :integer          default(0), not null
#  nationality      :string(255)
#  ideal_salary     :integer
#  chinese_ability  :string(255)
#  bonus_question   :text(1000)
#

class CommonApp < ActiveRecord::Base
  VIDEOS_POINTS = 2
  NOT_INCLUDED = 4 # id, created_at, updated_at, user_id
  
  after_update :set_progress 

  belongs_to :user
  has_one  :video, through: :user
  has_many :common_app_industry_relations, dependent: :destroy 
  has_many :industries, through: :common_app_industry_relations
  has_many :common_app_city_relations, dependent: :destroy 
  has_many :cities, through: :common_app_city_relations
  has_many :common_app_position_relations, dependent: :destroy 
  has_many :positions, through: :common_app_position_relations

  validates :user, presence: true
  mount_uploader :resume, ResumeUploader
  
  scope :with_dependents, -> do
    CommonApp.includes(:video)
      .includes(:industries)
      .includes(:cities)
      .includes(:positions)
  end 

  def progress
    total_questions = self.attribute_names.count + VIDEOS_POINTS - NOT_INCLUDED
    total_completed = 0 - NOT_INCLUDED

    attribute_names.each do |attr|
     total_completed += 1 if is_complete?(self[attr])
    end
    
    (100.0*total_completed/total_questions).round
  end

  private
  def set_progress
    current_progress = self.progress
    unless self.user.progress == current_progress 
      self.user.progress = current_progress
      self.user.save!
    end
  end

  def is_complete?(field)
    !field.blank? && field != 0
  end
end
