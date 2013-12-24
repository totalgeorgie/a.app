class CreateUserCityRelations < ActiveRecord::Migration
  def change
    create_table :user_city_relations do |t|
      t.integer :user_id
      t.integer :city_id

      t.timestamps
    end
  end
end
