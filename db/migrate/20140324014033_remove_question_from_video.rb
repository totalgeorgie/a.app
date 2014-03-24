class RemoveQuestionFromVideo < ActiveRecord::Migration
  def up
    remove_column :videos, :question
  end
  def down
    add_column :videos, :question, :text
  end
end
