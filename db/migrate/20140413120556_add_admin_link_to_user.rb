class AddAdminLinkToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin_link, :string, length: 16
    add_index :users, :admin_link
  end
end