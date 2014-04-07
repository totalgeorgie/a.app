class AddQuestionChoiceToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :question_choice, :string
  end
end