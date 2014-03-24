class ChangeAdminNoteLengthOnUser < ActiveRecord::Migration
  def change
    change_column :users, :admin_note, :text, limit: 800
  end
end