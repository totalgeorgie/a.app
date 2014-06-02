class CreateJobRoleTypeRelations < ActiveRecord::Migration
  def change
    create_table :job_role_type_relations do |t|
      t.integer :role_type_id
      t.integer :job_id

      t.timestamps
    end
  end
end
