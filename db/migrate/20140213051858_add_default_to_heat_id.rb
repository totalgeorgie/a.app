class AddDefaultToHeatId < ActiveRecord::Migration
  def change
    change_column(:users, :heat_id, :integer, default: 2)
  end
end
