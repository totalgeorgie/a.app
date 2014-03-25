class AddShortlistedToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :shortlisted, :boolean, default: false
    add_index :applications, :shortlisted
  end
end
