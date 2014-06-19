class AddToldAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :told_admin, :boolean
  end
end
