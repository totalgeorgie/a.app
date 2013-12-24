class CreateJobIndustryRelations < ActiveRecord::Migration
  def change
    create_table :job_industry_relations do |t|
      t.integer :job_id
      t.integer :industry_id

      t.timestamps
    end
  end
end
