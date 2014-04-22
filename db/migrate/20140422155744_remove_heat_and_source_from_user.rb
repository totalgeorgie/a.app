class RemoveHeatAndSourceFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :heat_id
    remove_column :users, :source_id
    drop_table :heats
    drop_table :sources
  end

  def down
    add_column :users, :heat_id, :integer
    add_column :users, :source_id, :integer
    create_table :heats do |t|
      t.integer :level
      t.timestamps
    end

    create_table :sources do |t|
      t.string :from
      t.timestaps
    end
  end
end