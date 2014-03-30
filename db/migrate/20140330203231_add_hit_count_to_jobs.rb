class AddHitCountToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :hit_count, :integer, default: 0
  end
end
