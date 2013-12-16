class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :user_id
      t.string :video_cid
      t.string :question

      t.timestamps
    end
  end
end
