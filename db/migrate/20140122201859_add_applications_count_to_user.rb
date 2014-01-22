class AddApplicationsCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :applications_count, :integer
  end
end
