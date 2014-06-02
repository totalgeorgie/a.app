class CreateCommonAppRoleTypeRelations < ActiveRecord::Migration
  def change
    create_table :common_app_role_type_relations do |t|
      t.integer :role_type_id
      t.integer :common_app_id

      t.timestamps
    end

    add_index :common_app_role_type_relations, :role_type_id
    add_index :common_app_role_type_relations, :common_app_id
  end
end