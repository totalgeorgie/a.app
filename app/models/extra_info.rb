# == Schema Information
#
# Table name: extra_infos
#
#  id           :integer          not null, primary key
#  linkedin_url :string(255)
#  source_place :string(255)
#  objective    :string(800)
#  experience_1 :string(1000)
#  experience_2 :string(1000)
#  other        :string(500)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  education    :text(1000)
#

class ExtraInfo < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: :true
end
