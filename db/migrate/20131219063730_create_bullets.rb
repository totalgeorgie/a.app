class CreateBullets < ActiveRecord::Migration
  def change
    create_table :bullets do |t|
      t.integer :job_id
      t.string :bullet

      t.timestamps
    end
  end
end
