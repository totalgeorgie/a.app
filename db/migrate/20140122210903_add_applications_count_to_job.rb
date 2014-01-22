class AddApplicationsCountToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :applications_count, :integer
  end
end
