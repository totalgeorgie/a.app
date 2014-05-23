class ChangeEducationOnExtraInfo < ActiveRecord::Migration
  def change
  	remove_column :extra_infos, :education1
  	remove_column :extra_infos, :education2
  	add_column :extra_infos, :education, :text, limit: 1000
  end
end
