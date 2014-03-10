class ChangeJobStringToText < ActiveRecord::Migration
  def up
   change_column :jobs, :job_summary, :text, limit: 500
   change_column :jobs, :qualifications, :text, limit: 1000
  end

  def down
   change_column :jobs, :job_summary, :string
   change_column :jobs, :qualifications, :string
  end
end
