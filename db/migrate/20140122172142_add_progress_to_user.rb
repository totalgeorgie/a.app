class AddProgressToUser < ActiveRecord::Migration
  def change
    add_column :users, :progress, :integer
  end
end
