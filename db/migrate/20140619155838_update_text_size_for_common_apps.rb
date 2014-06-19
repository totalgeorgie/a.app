class UpdateTextSizeForCommonApps < ActiveRecord::Migration
  def change
    change_column :china_time, :text, limit: 1000
    change_column :job_interest, :text, limit: 1000
    change_column :china_goals, :text, limit: 1000
  end
end