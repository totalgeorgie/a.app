class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :job_id
      t.string :role_title
      t.string :role_desc

      t.timestamps
    end
  end
end
