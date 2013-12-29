# == Schema Information
#
# Table name: positions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Position < ActiveRecord::Base
 has_many :common_app_positions_relations, :dependent => :destroy
 has_many :common_apps, :through => :common_app_position_relations

 has_many :job_positions_relations, :dependent => :destroy
 has_many :jobs, :through => :job_position_relations

end
