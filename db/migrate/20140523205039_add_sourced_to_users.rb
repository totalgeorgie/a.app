class AddSourcedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sourced, :boolean, default: :false
  end
end