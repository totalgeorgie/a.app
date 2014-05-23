class ChangeEducationOnExtraInfo < ActiveRecord::Migration
  def change
    remove_column :extra_infos, :education_1, :text
    remove_column :extra_infos, :education_2, :text
    add_column :extra_infos, :education, :text, limit: 1000
  end
end
