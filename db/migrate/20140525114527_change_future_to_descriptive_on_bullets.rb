class ChangeFutureToDescriptiveOnBullets < ActiveRecord::Migration
  def change
  	rename_column :bullets, :future, :descriptive
  end
end
