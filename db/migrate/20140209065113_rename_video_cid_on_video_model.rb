class RenameVideoCidOnVideoModel < ActiveRecord::Migration
  def change
    rename_column :videos, :video_cid, :video_uuid
  end
end
