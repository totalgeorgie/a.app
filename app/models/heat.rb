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

  def badge
    case self.id
     when 1
      "badge badge-important"
     when 2
      "badge badge-warning"
     when 4
      "badge badge-info"
     when 5
      "badge badge-inverse"
     else
      "badge"
    end
  end
end
