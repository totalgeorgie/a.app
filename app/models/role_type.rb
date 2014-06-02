class RoleType < ActiveRecord::Base
  has_many :common_app_role_type_relations, dependent: :destroy 
  has_many :common_apps, through: :common_app_role_type_relations
  has_many :job_role_type_relations, dependent: :destroy 
  has_many :jobs, through: :job_role_type_relations

  def self.preload
    RoleType.select(:id, :name).all.map{|ind| { id: ind.id.to_s, name: ind.name } }
  end
end