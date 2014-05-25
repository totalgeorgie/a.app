class AddIndexToJobIdeal < ActiveRecord::Migration
  def change
  	add_index :job_ideals, :job_id
  end
end