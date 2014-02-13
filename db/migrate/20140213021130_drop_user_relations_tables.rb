class DropUserRelationsTables < ActiveRecord::Migration
  
  def up
    drop_table :user_city_relations
    drop_table :user_industry_relations
    drop_table :user_position_relations
    drop_table :user_role_relations
  end

  def down
   create_table :user_city_relations do |t|
      t.integer  :user_id
      t.integer  :city_id
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :user_industry_relations do |t|
      t.integer  :user_id
      t.integer  :industry_id
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :user_position_relations do |t|
      t.integer  :user_id
      t.integer  :position_id
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :user_role_relations do |t|
      t.integer  :user_id
      t.integer  :role_id
      t.datetime :created_at
      t.datetime :updated_at
    end  
  end
end
