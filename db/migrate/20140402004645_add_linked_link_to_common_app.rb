class AddLinkedLinkToCommonApp < ActiveRecord::Migration
  def change
    add_column :common_apps, :linkedin_link, :string, length: 500
  end
end
