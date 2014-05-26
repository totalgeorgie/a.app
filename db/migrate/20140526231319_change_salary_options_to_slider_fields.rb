class ChangeSalaryOptionsToSliderFields < ActiveRecord::Migration
  def change
  	rename_column :common_apps, :ideal_salary, :salary_pref
  	change_column :common_apps, :salary_pref, :integer
    add_column :common_apps, :culture_pref, :integer
  end
end