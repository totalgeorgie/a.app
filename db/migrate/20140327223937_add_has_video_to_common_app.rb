class AddHasVideoToCommonApp < ActiveRecord::Migration
  def change
    add_column :common_apps, :has_video, :boolean, default: false
  end
end
