class RemovePositions < ActiveRecord::Migration
  def change
    remove_column :common_apps, :positions_count
  end
end
