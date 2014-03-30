class AddStatusToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :status, :string, default: 'SENT'
  end
end
