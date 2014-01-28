class AddUserJobIdToPotentials < ActiveRecord::Migration
  def change
    add_column :potentials, :user_id, :integer
    add_column :potentials, :job_id, :integer
  end
end
