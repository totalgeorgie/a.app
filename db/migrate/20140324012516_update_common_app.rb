class UpdateCommonApp < ActiveRecord::Migration
  def up
    remove_column :common_apps, :read_type
    remove_column :common_apps, :listen_speak
    remove_column :common_apps, :time_in_china
    remove_column :common_apps, :cover_letter

    add_column :common_apps, :nationality, :string
    add_column :common_apps, :ideal_salary, :integer
    add_column :common_apps, :chinese_ability, :string
    add_column :common_apps, :bonus_question, :text, limit: 1000
  end

  def down
    add_column :common_apps, :read_type
    add_column :common_apps, :listen_speak
    add_column :common_apps, :time_in_china
    add_column :common_apps, :cover_letter

    remove_column :common_apps, :nationality
    remove_column :common_apps, :ideal_salary, :integer
    remove_column :common_apps, :chinese_ability
    remove_column :common_apps, :bonus_question
  end
end
