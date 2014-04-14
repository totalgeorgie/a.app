class RemoveLinkedLinkFromColumns < ActiveRecord::Migration
  def change
  	remove_column :common_apps, :linked_link
  end
end
