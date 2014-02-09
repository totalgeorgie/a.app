class AddVideoUuidToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :video_uuid, :string
  end
end
