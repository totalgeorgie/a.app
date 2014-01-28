# == Schema Information
#
# Table name: sources
#
#  id         :integer          not null, primary key
#  from       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Source < ActiveRecord::Base
  has_many :users
end
