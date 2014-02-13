class AddIndexesToTables < ActiveRecord::Migration
  def change
    add_index :answers, [:application_id, :question_id], name: "answers_idx"
    add_index :applications, [:user_id, :job_id], name: "applications_idx"
    add_index :bullets, :job_id, name: "bullet_jobs_idx"

    add_index :common_app_city_relations,     [:common_app_id,     :city_id], name: "app_city_idx"
    add_index :common_app_industry_relations, [:common_app_id, :industry_id], name: "app_industry_idx"
    add_index :common_app_position_relations, [:common_app_id, :position_id], name: "app_pos_idx"

    add_index :job_city_relations,     [:job_id, :city_id], name: "job_city_idx"
    add_index :job_industry_relations, [:job_id, :industry_id], name: "job_industry_idx"
    add_index :job_position_relations, [:job_id, :position_id], name: "job_pos_idx"

    add_index :common_apps, :user_id, name: "common_app_users_idx"
    add_index :questions, :job_id, name: "questions_job_idx"
    add_index :roles, :job_id, name: "roles_job_idx"

    #to do :potentials?
    add_index :users, [:heat_id, :source_id], name: "users_idx"
    add_index :videos, :user_id, name: "videos_user_idx"
  end
end

#to remove user_city_relations user_industry_relations user_position_relations user_role_relations