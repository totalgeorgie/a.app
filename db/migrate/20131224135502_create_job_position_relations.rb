class CreateJobPositionRelations < ActiveRecord::Migration
  def change
    create_table :job_position_relations do |t|
      t.integer :job_id
      t.integer :position_id

      t.timestamps
    end
  end
end
