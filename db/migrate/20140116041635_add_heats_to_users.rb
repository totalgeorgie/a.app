class AddHeatsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :heat_id, :integer
  end
end
