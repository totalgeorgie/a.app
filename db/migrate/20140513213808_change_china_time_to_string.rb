class ChangeChinaTimeToString < ActiveRecord::Migration
  def change
  	change_column :common_apps, :china_time, :string
  end
end
