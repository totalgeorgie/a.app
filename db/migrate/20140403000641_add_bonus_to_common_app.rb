class AddBonusToCommonApp < ActiveRecord::Migration
  def change
    add_column :common_apps, :bonus_choice, :text, length: 300
  end
end