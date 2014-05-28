class ChangeBonusQuestionToChinaContrib < ActiveRecord::Migration
  def change
  	rename_column :common_apps, :bonus_question, :china_contrib
  end
end
