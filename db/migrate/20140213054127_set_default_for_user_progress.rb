class SetDefaultForUserProgress < ActiveRecord::Migration
  def change
    change_column(:users, :progress, :integer, default: 5)
  end
end
