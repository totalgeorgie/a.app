class CreateCommonAppCityRelations < ActiveRecord::Migration
  def change
    create_table :common_app_city_relations do |t|
      t.integer :common_app_id
      t.integer :city_id

      t.timestamps
    end
  end
end
