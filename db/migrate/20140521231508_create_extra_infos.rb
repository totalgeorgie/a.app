class CreateExtraInfos < ActiveRecord::Migration
  def change
    create_table :extra_infos do |t|
      t.string :linkedin_url
      t.string :source_place
      t.string :intro
      t.string :experience_1
      t.string :experience_2
      t.string :education_1
      t.string :education_2
      t.string :skills
      t.string :other

      t.timestamps
    end
  end
end
