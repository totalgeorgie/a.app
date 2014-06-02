class CreateJobRoleTypeRelations < ActiveRecord::Migration
  def change
    create_table :job_role_type_relations do |t|
      t.integer :role_type_id
      t.integer :job_id

      t.timestamps
    end
    add_index :job_role_type_relations, :role_type_id
    add_index :job_role_type_relations, :job_id
  end
end
