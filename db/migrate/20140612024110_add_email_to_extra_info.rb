class AddEmailToExtraInfo < ActiveRecord::Migration
  def change
    add_column :extra_infos, :email, :string
  end
end
