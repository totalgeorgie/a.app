class RemoveHasVideoFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :has_video
  end

  def down
    add_column :users, :has_video, :boolean
  end
end