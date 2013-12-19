class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.string :job_summary
      t.string :qualifications

      t.timestamps
    end
  end
end
