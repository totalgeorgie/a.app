class CreatePotentials < ActiveRecord::Migration
  def change
    create_table :potentials do |t|
      t.integer :level

      t.timestamps
    end
  end
end
