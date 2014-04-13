class UpdateIndexesOnModels < ActiveRecord::Migration
  def change
    remove_index :answers, name: :answers_idx
    add_index :answers, :application_id
    add_index :answers, :question_id

    remove_index :applications, column: :shortlisted
    remove_index :applications, name: :applications_idx
    add_index :applications, :user_id
    add_index :applications, :job_id

    remove_index :common_app_city_relations, name: :app_city_idx
    add_index :common_app_city_relations, :common_app_id
    add_index :common_app_city_relations, :city_id

    remove_index :common_app_industry_relations, name: :app_industry_idx
    add_index :common_app_industry_relations, :common_app_id
    add_index :common_app_industry_relations, :industry_id

    remove_index :common_app_position_relations, name: :app_pos_idx
    add_index :common_app_position_relations, :common_app_id
    add_index :common_app_position_relations, :position_id

    remove_index :job_city_relations, name: :job_city_idx
    add_index :job_city_relations, :job_id
    add_index :job_city_relations, :city_id

    remove_index :job_industry_relations, name: :job_industry_idx
    add_index :job_industry_relations, :job_id
    add_index :job_industry_relations, :industry_id

    remove_index :job_position_relations, name: :job_pos_idx
    add_index :job_position_relations, :job_id
    add_index :job_position_relations, :position_id

    remove_index :users, name: :users_idx
  end
end
