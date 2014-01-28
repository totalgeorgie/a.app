class AddSourceIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :source_id, :integer
  end
end
