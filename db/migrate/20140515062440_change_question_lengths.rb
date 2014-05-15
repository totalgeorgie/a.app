class ChangeQuestionLengths < ActiveRecord::Migration
  def change
  	change_column :questions, :content, :text, limit: 500
  end
end
