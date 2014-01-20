class AddAdminNotesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_note, :string
  end
end
