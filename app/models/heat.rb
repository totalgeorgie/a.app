# == Schema Information
#
# Table name: heats
#
#  id         :integer          not null, primary key
#  level      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Heat < ActiveRecord::Base
  has_many :users
end
