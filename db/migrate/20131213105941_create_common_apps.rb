class CreateCommonApps < ActiveRecord::Migration
  def change
    create_table :common_apps do |t|
      t.integer :user_id
      t.string :current_city
      t.integer :grad_year
      t.string :read_type
      t.string :listen_speak
      t.integer :time_in_china
      t.string :cover_letter
      t.string :resume

      t.timestamps
    end
  end
end
