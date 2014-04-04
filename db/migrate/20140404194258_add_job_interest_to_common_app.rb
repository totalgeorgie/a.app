class AddJobInterestToCommonApp < ActiveRecord::Migration
  def change
    add_column :common_apps, :job_interest, :string
  end
end
