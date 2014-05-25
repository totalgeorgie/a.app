class DropBooleanFromBullets < ActiveRecord::Migration
  def change
    remove_column :bullets, :descriptive
  end
end