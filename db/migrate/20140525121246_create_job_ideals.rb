class CreateJobIdeals < ActiveRecord::Migration
  def change
    create_table :job_ideals do |t|
      t.string :content
      t.string :job_id

      t.timestamps
    end
  end
end
