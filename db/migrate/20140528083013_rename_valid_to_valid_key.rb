class RenameValidToValidKey < ActiveRecord::Migration
  def change
  	rename_column :secret_keys, :valid, :still_valid
  end
end
