class ChangeDatatypeForLevel < ActiveRecord::Migration
  def self.up
    change_table :heats do |t|
      t.change :level, :string
    end
  end
  def self.down
    change_table :heats do |t|
      t.change :level, :integer
    end
  end
end
