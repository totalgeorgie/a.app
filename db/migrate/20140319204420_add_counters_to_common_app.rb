class AddCountersToCommonApp < ActiveRecord::Migration
  def change
    add_column :common_apps, 
      :industries_count, 
      :integer,
      null: false,
      default: 0
    add_column :common_apps, 
      :cities_count, 
      :integer,
      null: false,
      default: 0
    add_column :common_apps, 
      :positions_count, 
      :integer,
      null: false,
      default: 0
  end
end
