class CreateSecretKeys < ActiveRecord::Migration
  def change
    create_table :secret_keys do |t|
      t.string :code
      t.boolean :valid, default: true
      t.timestamps
    end

    add_index :secret_keys, :code, unique: true
  end
end
