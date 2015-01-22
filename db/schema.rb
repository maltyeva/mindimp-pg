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

ActiveRecord::Schema.define(version: 20150122025111) do

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

  create_table "course_categories", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
