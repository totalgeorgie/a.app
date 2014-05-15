class ChangeRoleLengths < ActiveRecord::Migration
  def change
  	change_column :roles, :role_title, :text, limit: 500
	change_column :roles, :role_desc, :text, limit: 1000
  end
end
