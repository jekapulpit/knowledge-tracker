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

ActiveRecord::Schema.define(version: 2019_01_09_094954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.string "answer_text"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "value"
    t.bigint "technology_id"
    t.index ["technology_id"], name: "index_marks_on_technology_id"
    t.index ["user_id"], name: "index_marks_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "answers_id"
    t.bigint "test_id"
    t.integer "right_answer"
    t.index ["answers_id"], name: "index_questions_on_answers_id"
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "title"
    t.text "discription"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "views", default: 0
    t.bigint "category_id"
    t.float "average_mark"
    t.index ["category_id"], name: "index_technologies_on_category_id"
  end

  create_table "technologies_users", force: :cascade do |t|
    t.float "progress", default: 0.0
    t.bigint "user_id"
    t.bigint "technology_id"
    t.index ["technology_id"], name: "index_technologies_users_on_technology_id"
    t.index ["user_id"], name: "index_technologies_users_on_user_id"
  end

  create_table "test_results", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "test_id"
    t.integer "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_test_results_on_test_id"
    t.index ["user_id"], name: "index_test_results_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title"
    t.text "discription"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "technology_id"
    t.index ["technology_id"], name: "index_tests_on_technology_id"
    t.index ["users_id"], name: "index_tests_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "lang", default: "ru"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "marks", "technologies"
  add_foreign_key "marks", "users"
  add_foreign_key "questions", "answers", column: "answers_id"
  add_foreign_key "questions", "tests"
  add_foreign_key "technologies", "categories"
  add_foreign_key "tests", "technologies"
end
