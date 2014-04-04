class ChangeIdealSalaryToStringOnCommonApp < ActiveRecord::Migration
  def change
    change_column :common_apps, :ideal_salary, :string
  end
end