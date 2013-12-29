# == Schema Information
#
# Table name: industries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Industry < ActiveRecord::Base
 has_many :common_app_industry_relations, :dependent => :destroy 
 has_many :common_apps, :through => :common_app_industry_relations

 has_many :job_industry_relations, :dependent => :destroy 
 has_many :jobs, :through => :job_industry_relations

end
