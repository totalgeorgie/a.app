class SetDefaultsForSalaryOpts < ActiveRecord::Migration
  def change
  	change_column :common_apps, :salary_pref, :integer, default: 0
  	change_column :common_apps, :culture_pref, :integer, default: 0
  end
end