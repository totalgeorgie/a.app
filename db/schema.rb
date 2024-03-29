# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140619160249) do

  create_table "answers", force: true do |t|
    t.integer  "application_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content",        limit: 1000
    t.string   "video_uuid"
  end

  add_index "answers", ["application_id"], name: "index_answers_on_application_id"
  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "applications", force: true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "shortlisted", default: false
    t.string   "status",      default: "SENT"
  end

  add_index "applications", ["job_id"], name: "index_applications_on_job_id"
  add_index "applications", ["user_id"], name: "index_applications_on_user_id"

  create_table "bullets", force: true do |t|
    t.integer  "job_id"
    t.string   "bullet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bullets", ["job_id"], name: "bullet_jobs_idx"

  create_table "cities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "common_app_city_relations", force: true do |t|
    t.integer  "common_app_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "common_app_city_relations", ["city_id"], name: "index_common_app_city_relations_on_city_id"
  add_index "common_app_city_relations", ["common_app_id"], name: "index_common_app_city_relations_on_common_app_id"

  create_table "common_app_industry_relations", force: true do |t|
    t.integer  "common_app_id"
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "common_app_industry_relations", ["common_app_id"], name: "index_common_app_industry_relations_on_common_app_id"
  add_index "common_app_industry_relations", ["industry_id"], name: "index_common_app_industry_relations_on_industry_id"

  create_table "common_app_position_relations", force: true do |t|
    t.integer  "common_app_id"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "common_app_position_relations", ["common_app_id"], name: "index_common_app_position_relations_on_common_app_id"
  add_index "common_app_position_relations", ["position_id"], name: "index_common_app_position_relations_on_position_id"

  create_table "common_app_role_type_relations", force: true do |t|
    t.integer  "role_type_id"
    t.integer  "common_app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "common_app_role_type_relations", ["common_app_id"], name: "index_common_app_role_type_relations_on_common_app_id"
  add_index "common_app_role_type_relations", ["role_type_id"], name: "index_common_app_role_type_relations_on_role_type_id"

  create_table "common_apps", force: true do |t|
    t.integer  "user_id"
    t.string   "current_city"
    t.integer  "grad_year"
    t.string   "resume"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "industries_count",              default: 0,     null: false
    t.integer  "cities_count",                  default: 0,     null: false
    t.string   "nationality"
    t.integer  "salary_pref",      limit: 255,  default: 0
    t.text     "china_contrib",    limit: 1000
    t.integer  "progress",                      default: 5
    t.boolean  "has_video",                     default: false
    t.text     "china_time",       limit: 1000
    t.text     "job_interest",     limit: 1000
    t.text     "china_goals",      limit: 1000
    t.integer  "culture_pref",                  default: 0
  end

  add_index "common_apps", ["user_id"], name: "common_app_users_idx"

  create_table "extra_infos", force: true do |t|
    t.string   "linkedin_url"
    t.string   "source_place"
    t.string   "objective",    limit: 800
    t.string   "experience_1", limit: 1000
    t.string   "experience_2", limit: 1000
    t.string   "other",        limit: 500
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "education",    limit: 1000
    t.string   "email"
  end

  add_index "extra_infos", ["user_id"], name: "index_extra_infos_on_user_id"

  create_table "industries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_city_relations", force: true do |t|
    t.integer  "job_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_city_relations", ["city_id"], name: "index_job_city_relations_on_city_id"
  add_index "job_city_relations", ["job_id"], name: "index_job_city_relations_on_job_id"

  create_table "job_ideals", force: true do |t|
    t.string   "content"
    t.string   "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_ideals", ["job_id"], name: "index_job_ideals_on_job_id"

  create_table "job_industry_relations", force: true do |t|
    t.integer  "job_id"
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_industry_relations", ["industry_id"], name: "index_job_industry_relations_on_industry_id"
  add_index "job_industry_relations", ["job_id"], name: "index_job_industry_relations_on_job_id"

  create_table "job_position_relations", force: true do |t|
    t.integer  "job_id"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_position_relations", ["job_id"], name: "index_job_position_relations_on_job_id"
  add_index "job_position_relations", ["position_id"], name: "index_job_position_relations_on_position_id"

  create_table "job_role_type_relations", force: true do |t|
    t.integer  "role_type_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_role_type_relations", ["job_id"], name: "index_job_role_type_relations_on_job_id"
  add_index "job_role_type_relations", ["role_type_id"], name: "index_job_role_type_relations_on_role_type_id"

  create_table "jobs", force: true do |t|
    t.text     "job_title",          limit: 500
    t.text     "job_summary",        limit: 500
    t.text     "qualifications",     limit: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "applications_count"
    t.integer  "hit_count",                       default: 0
  end

  create_table "positions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "potentials", force: true do |t|
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "job_id"
  end

  create_table "questions", force: true do |t|
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content",    limit: 500
  end

  add_index "questions", ["job_id"], name: "questions_job_idx"

  create_table "role_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.integer  "job_id"
    t.text     "role_title", limit: 500
    t.text     "role_desc",  limit: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["job_id"], name: "roles_job_idx"

  create_table "secret_keys", force: true do |t|
    t.string   "code"
    t.boolean  "still_valid", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "secret_keys", ["code"], name: "index_secret_keys_on_code", unique: true

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                              default: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.text     "admin_note",             limit: 800
    t.integer  "applications_count"
    t.string   "admin_link"
    t.boolean  "sourced",                            default: false
    t.boolean  "told_admin"
  end

  add_index "users", ["admin_link"], name: "index_users_on_admin_link"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["password_reset_token"], name: "index_users_on_password_reset_token"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "videos", force: true do |t|
    t.integer  "user_id"
    t.string   "video_uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "question_choice"
  end

  add_index "videos", ["user_id"], name: "videos_user_idx"

end
