class CreateCommonAppIndustryRelations < ActiveRecord::Migration
  def change
    create_table :common_app_industry_relations do |t|
      t.integer :common_app_id
      t.integer :industry_id

      t.timestamps
    end
  end
end
