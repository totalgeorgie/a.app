class AddChinaGoalsToCommonApp < ActiveRecord::Migration
  def change
    add_column :common_apps, :china_goals, :string, length: 1000
  end
end