class AddContentToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :content, :string
  end
end
