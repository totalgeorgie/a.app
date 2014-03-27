class RemoveProgressFromCommonApp < ActiveRecord::Migration
  def change
    remove_column :users, :progress, :integer
    add_column :common_apps, :progress, :integer, default: 5
  end
end
