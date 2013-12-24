# == Schema Information
#
# Table name: job_city_relations
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  city_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class JobCityRelation < ActiveRecord::Base
 belongs_to :job
 belongs_to :city
end
