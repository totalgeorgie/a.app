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

ActiveRecord::Schema.define(version: 20140116041635) do

  create_table "answers", force: true do |t|
    t.integer  "application_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content"
  end

  create_table "applications", force: true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bullets", force: true do |t|
    t.integer  "job_id"
    t.string   "bullet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "common_app_industry_relations", force: true do |t|
    t.integer  "common_app_id"
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "common_app_position_relations", force: true do |t|
    t.integer  "common_app_id"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "common_apps", force: true do |t|
    t.integer  "user_id"
    t.string   "current_city"
    t.integer  "grad_year"
    t.string   "read_type"
    t.string   "listen_speak"
    t.integer  "time_in_china"
    t.string   "cover_letter"
    t.string   "resume"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "heats", force: true do |t|
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "job_industry_relations", force: true do |t|
    t.integer  "job_id"
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_position_relations", force: true do |t|
    t.integer  "job_id"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "job_title"
    t.string   "job_summary"
    t.string   "qualifications"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content"
  end

  create_table "roles", force: true do |t|
    t.integer  "job_id"
    t.string   "role_title"
    t.string   "role_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_city_relations", force: true do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_industry_relations", force: true do |t|
    t.integer  "user_id"
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_position_relations", force: true do |t|
    t.integer  "user_id"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_role_relations", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                  default: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "heat_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "videos", force: true do |t|
    t.integer  "user_id"
    t.string   "video_cid"
    t.string   "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
