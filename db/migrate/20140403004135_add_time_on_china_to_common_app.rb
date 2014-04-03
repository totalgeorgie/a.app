class AddTimeOnChinaToCommonApp < ActiveRecord::Migration
  def change
    add_column :common_apps, :china_time, :integer
  end
end
