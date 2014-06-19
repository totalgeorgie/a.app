class UpdateTextSizeForCommonApps < ActiveRecord::Migration
  def change
    change_column :common_apps, :china_time, :text, limit: 1000
    change_column :common_apps, :job_interest, :text, limit: 1000
    change_column :common_apps, :china_goals, :text, limit: 1000
  end
end