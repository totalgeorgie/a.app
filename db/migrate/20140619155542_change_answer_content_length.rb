class ChangeAnswerContentLength < ActiveRecord::Migration
  def change
  	change_column :answers, :content, :text, limit: 1000
  end
end