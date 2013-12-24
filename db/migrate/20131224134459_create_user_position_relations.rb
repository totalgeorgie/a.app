class CreateUserPositionRelations < ActiveRecord::Migration
  def change
    create_table :user_position_relations do |t|
      t.integer :user_id
      t.integer :position_id

      t.timestamps
    end
  end
end
