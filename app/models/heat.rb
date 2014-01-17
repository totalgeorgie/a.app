# == Schema Information
#
# Table name: heats
#
#  id         :integer          not null, primary key
#  level      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# 1 : High, 2: Medium 3: Normal 4: Low 5: Very Low 

class Heat < ActiveRecord::Base
  has_many :users

  def badge_level
    "badge" # if id is 3, or nil 
    "badge badge-important" if self.id == 1
    "badge badge-warning" if self.id == 2
    "badge badge-info" if self.id == 4
    "badge badge-inverse" if self.id == 5
  end

end
