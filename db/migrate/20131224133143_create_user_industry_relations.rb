class CreateUserIndustryRelations < ActiveRecord::Migration
  def change
    create_table :user_industry_relations do |t|
      t.integer :user_id
      t.integer :industry_id

      t.timestamps
    end
  end
end
