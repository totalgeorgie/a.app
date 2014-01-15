class CreateHeats < ActiveRecord::Migration
  def change
    create_table :heats do |t|
      t.integer :level

      t.timestamps
    end
  end
end
