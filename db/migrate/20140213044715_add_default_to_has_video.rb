class AddDefaultToHasVideo < ActiveRecord::Migration
  def change
    change_column(:users, :has_video, :boolean, default: false)
  end
end
