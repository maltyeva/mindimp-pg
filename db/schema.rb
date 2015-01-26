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

ActiveRecord::Schema.define(version: 20150126075249) do

  create_table "assignment_responses", force: true do |t|
    t.text     "text"
    t.datetime "submitted"
    t.string   "grade"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "course_assignment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_categories", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "description"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_category_id"
    t.integer  "lexile_measure"
  end

  create_table "books_categories", force: true do |t|
    t.integer "book_id"
    t.integer "book_category_id"
  end

  create_table "course_assignments", force: true do |t|
    t.integer  "number"
    t.string   "title"
    t.text     "description"
    t.string   "format"
    t.datetime "due_date"
    t.integer  "course_session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_categories", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_periods", force: true do |t|
    t.string   "title"
    t.integer  "year"
    t.integer  "period_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.boolean  "upcoming"
    t.boolean  "past"
  end

  create_table "course_sessions", force: true do |t|
    t.string   "title"
    t.string   "time"
    t.string   "duration"
    t.string   "instructor"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_period_id"
    t.boolean  "active"
  end

  create_table "courses", force: true do |t|
    t.string   "title"
    t.string   "abbreviation"
    t.string   "description"
    t.string   "syllabus_file_name"
    t.string   "syllabus_content_type"
    t.integer  "syllabus_file_size"
    t.datetime "syllabus_updated_at"
    t.integer  "session_no"
    t.integer  "course_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_category_id"
  end

  create_table "discussion_questions", force: true do |t|
    t.text     "question"
    t.integer  "question_number"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "royce_connector", force: true do |t|
    t.integer  "roleable_id",   null: false
    t.string   "roleable_type", null: false
    t.integer  "role_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "royce_connector", ["role_id"], name: "index_royce_connector_on_role_id", using: :btree
  add_index "royce_connector", ["roleable_id", "roleable_type"], name: "index_royce_connector_on_roleable_id_and_roleable_type", using: :btree

  create_table "royce_role", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "royce_role", ["name"], name: "index_royce_role_on_name", using: :btree

  create_table "students_sessions", force: true do |t|
    t.integer "user_id"
    t.integer "course_session_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                                      null: false
    t.string   "crypted_password",                           null: false
    t.string   "salt",                                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nick_name"
    t.integer  "age"
    t.boolean  "is_admin",                   default: false
    t.boolean  "is_student",                 default: true
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.datetime "last_login"
    t.string   "hometown"
    t.string   "high_school"
    t.text     "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
