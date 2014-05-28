class RemoveBonusChoiceFromCommonApp < ActiveRecord::Migration
  def change
  	remove_column :common_apps, :bonus_choice, :text
  end
end
