# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema
# definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach
# (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# It's strongly recommended that you check this file into your version
# control system.
=======
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_12_12_125954) do
>>>>>>> installing simple-form and activeStorage
=======
=======
>>>>>>> rubocop changes 2.0
# It's strongly recommended that you check this file into your version control system.

# It's strongly recommended that you check this file into your version
# control system.
<<<<<<< HEAD
>>>>>>> 993bdb0... rubocop changes
>>>>>>> commit from master
=======
>>>>>>> rubocop changes 2.0

ActiveRecord::Schema.define(version: 20_181_207_193_156) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  create_table 'answers', force: :cascade do |t|
    t.string 'answer_text'
    t.bigint 'question_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
=======
=======
>>>>>>> commit from master
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
=======
  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
>>>>>>> rubocop changes 2.0
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

<<<<<<< HEAD
  create_table "answers", force: :cascade do |t|
    t.string "answer_text"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
<<<<<<< HEAD
>>>>>>> installing simple-form and activeStorage
=======
=======
=======
>>>>>>> rubocop changes 2.0
  create_table 'answers', force: :cascade do |t|
    t.string 'answer_text'
    t.bigint 'question_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
<<<<<<< HEAD
>>>>>>> 993bdb0... rubocop changes
>>>>>>> commit from master
=======
>>>>>>> rubocop changes 2.0
  end

  create_table 'questions', force: :cascade do |t|
    t.text 'question_text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'answers_id'
    t.index ['answers_id'], name: 'index_questions_on_answers_id'
  end

  create_table 'technologies', force: :cascade do |t|
    t.string 'title'
    t.text 'discription'
    t.float 'progress'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'technologies_users', id: false, force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'technology_id', null: false
    t.index ['technology_id'], name: 'index_technologies_users_on_technology_id'
    t.index ['user_id'], name: 'index_technologies_users_on_user_id'
  end

  create_table 'test_results', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'test_id'
    t.integer 'result'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['test_id'], name: 'index_test_results_on_test_id'
    t.index ['user_id'], name: 'index_test_results_on_user_id'
  end

  create_table 'tests', force: :cascade do |t|
    t.string 'title'
    t.text 'discription'
    t.bigint 'users_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['users_id'], name: 'index_tests_on_users_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'password'
    t.string 'lang', default: 'ru'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.string 'provider'
    t.string 'uid'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'],
            name: 'index_users_on_reset_password_token',
            unique: true
  end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  add_foreign_key 'questions', 'answers', column: 'answers_id'
=======
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "questions", "answers", column: "answers_id"
>>>>>>> installing simple-form and activeStorage
=======
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "questions", "answers", column: "answers_id"
=======
  add_foreign_key 'questions', 'answers', column: 'answers_id'
>>>>>>> 993bdb0... rubocop changes
>>>>>>> commit from master
=======
  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'questions', 'answers', column: 'answers_id'
>>>>>>> rubocop changes 2.0
end
