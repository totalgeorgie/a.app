class CreateCommonAppPositionRelations < ActiveRecord::Migration
  def change
    create_table :common_app_position_relations do |t|
      t.integer :common_app_id
      t.integer :position_id

      t.timestamps
    end
  end
end
