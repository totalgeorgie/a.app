class FixSourceTypeName < ActiveRecord::Migration
  def change
    rename_column :sources, :type, :from
  end
end
