class ChangeJobTitleLength < ActiveRecord::Migration
  def change
    change_column :jobs, :job_title, :text, limit: 500
  end
end
