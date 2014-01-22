class AddHasVideoToUser < ActiveRecord::Migration
  def change
    add_column :users, :has_video, :boolean
  end
end
