class AddFutureToBullets < ActiveRecord::Migration
  def change
    add_column :bullets, :future, :boolean, default: false
  end
end
