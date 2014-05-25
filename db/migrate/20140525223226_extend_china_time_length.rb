class ExtendChinaTimeLength < ActiveRecord::Migration
  def change
  	change_column :common_apps, :china_time, :text, length: 500
  end
end
