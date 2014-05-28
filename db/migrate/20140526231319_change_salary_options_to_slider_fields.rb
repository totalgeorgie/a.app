class ChangeSalaryOptionsToSliderFields < ActiveRecord::Migration
  def change
  	remove_column :common_apps, :ideal_salary
  	create_column :common_apps, :salary_pref, :integer
    add_column :common_apps, :culture_pref, :integer
  end
end