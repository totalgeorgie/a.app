class CreateJobCityRelations < ActiveRecord::Migration
  def change
    create_table :job_city_relations do |t|
      t.integer :job_id
      t.integer :city_id

      t.timestamps
    end
  end
end
