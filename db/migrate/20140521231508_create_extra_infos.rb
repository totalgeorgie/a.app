class CreateExtraInfos < ActiveRecord::Migration
  def change
    create_table :extra_infos do |t|
      t.string :linkedin_url
      t.string :source_place
      t.string :objective, limit: 800
      t.string :experience_1, limit: 1000
      t.string :experience_2, limit: 1000
      t.string :education_1, limit: 1000
      t.string :education_2, limit: 1000
      t.string :other, limit: 500
      t.integer :user_id, null: :false
      t.timestamps
    end

    add_index :extra_infos, :user_id 
  end
end