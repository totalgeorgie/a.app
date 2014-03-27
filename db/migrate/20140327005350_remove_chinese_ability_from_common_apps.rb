class RemoveChineseAbilityFromCommonApps < ActiveRecord::Migration
  def up
    remove_column :common_apps, :chinese_ability
  end

  def down
    add_column :common_apps, :chinese_abiity, :string
  end
end
