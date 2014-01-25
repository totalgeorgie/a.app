class AddPotentialToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :potential, :integer
  end
end
