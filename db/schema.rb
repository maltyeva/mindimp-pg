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

ActiveRecord::Schema.define(version: 20150410082150) do

  create_table "article_lists", force: true do |t|
    t.integer  "watcher_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_lists", ["article_id"], name: "index_article_lists_on_article_id", using: :btree
  add_index "article_lists", ["watcher_id", "article_id"], name: "index_article_lists_on_watcher_id_and_article_id", unique: true, using: :btree
  add_index "article_lists", ["watcher_id"], name: "index_article_lists_on_watcher_id", using: :btree

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "source"
    t.string   "url"
    t.string   "category"
    t.datetime "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "word_count"
    t.string   "level"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "assessments", force: true do |t|
    t.string   "effort_grade"
    t.text     "effort_comments"
    t.string   "communication_grade"
    t.text     "communication_comments"
    t.string   "eng_writing_grade"
    t.text     "eng_writing_comments"
    t.string   "eng_speaking_grade"
    t.text     "eng_speaking_comments"
    t.string   "eng_reading_grade"
    t.text     "eng_reading_comments"
    t.string   "crit_thinking_grade"
    t.text     "crit_thinking_comments"
    t.string   "progress_grade"
    t.text     "progress_comments"
    t.text     "gen_comments"
    t.integer  "user_id"
    t.integer  "course_session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignment_responses", force: true do |t|
    t.text     "text"
    t.datetime "submitted"
    t.string   "grade"
    t.text     "comments"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "course_assignment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "grader_id"
  end

  create_table "badges_sashes", force: true do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
  end

  add_index "badges_sashes", ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id", using: :btree
  add_index "badges_sashes", ["badge_id"], name: "index_badges_sashes_on_badge_id", using: :btree
  add_index "badges_sashes", ["sash_id"], name: "index_badges_sashes_on_sash_id", using: :btree

  create_table "book_categories", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_lists", force: true do |t|
    t.integer  "watcher_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "book_lists", ["book_id"], name: "index_book_lists_on_book_id", using: :btree
  add_index "book_lists", ["watcher_id", "book_id"], name: "index_book_lists_on_watcher_id_and_book_id", unique: true, using: :btree
  add_index "book_lists", ["watcher_id"], name: "index_book_lists_on_watcher_id", using: :btree

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
    t.string   "url"
    t.integer  "page_count"
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
    t.boolean  "visible",           default: false
  end

  create_table "course_categories", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_files", force: true do |t|
    t.string   "title"
    t.integer  "course_packet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "course_meetings", force: true do |t|
    t.integer  "course_session_id"
    t.text     "instructor_notes"
    t.text     "preparation_notes"
    t.text     "class_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "course_packets", force: true do |t|
    t.string   "title"
    t.integer  "course_id"
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
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_period_id"
    t.boolean  "active"
    t.integer  "instructor_id"
    t.string   "instructor_name"
    t.boolean  "has_course_packet", default: false
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
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible",     default: false
    t.string   "chapter"
    t.integer  "week_number"
    t.string   "chapters"
    t.integer  "article_id"
  end

  create_table "discussion_responses", force: true do |t|
    t.text     "response"
    t.integer  "user_id"
    t.integer  "discussion_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comments"
    t.integer  "comment_by"
  end

  create_table "instructors", force: true do |t|
    t.integer  "course_session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_actions", force: true do |t|
    t.integer  "user_id"
    t.string   "action_method"
    t.integer  "action_value"
    t.boolean  "had_errors",    default: false
    t.string   "target_model"
    t.integer  "target_id"
    t.text     "target_data"
    t.boolean  "processed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_activity_logs", force: true do |t|
    t.integer  "action_id"
    t.string   "related_change_type"
    t.integer  "related_change_id"
    t.string   "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: true do |t|
    t.integer  "score_id"
    t.integer  "num_points", default: 0
    t.string   "log"
    t.datetime "created_at"
  end

  create_table "merit_scores", force: true do |t|
    t.integer "sash_id"
    t.string  "category", default: "default"
  end

  create_table "read_books", force: true do |t|
    t.integer  "reader_id"
    t.integer  "read_book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "read_books", ["read_book_id"], name: "index_read_books_on_read_book_id", using: :btree
  add_index "read_books", ["reader_id", "read_book_id"], name: "index_read_books_on_reader_id_and_read_book_id", unique: true, using: :btree
  add_index "read_books", ["reader_id"], name: "index_read_books_on_reader_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

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

  create_table "sashes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students_sessions", force: true do |t|
    t.integer "user_id"
    t.integer "course_session_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                                           null: false
    t.string   "crypted_password",                                null: false
    t.string   "salt",                                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nick_name"
    t.integer  "age"
    t.boolean  "is_admin",                        default: false
    t.boolean  "is_student",                      default: true
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.string   "activation_digest"
    t.datetime "last_login"
    t.string   "hometown"
    t.string   "high_school"
    t.text     "bio"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "skype_id"
    t.string   "phone"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.boolean  "articles_permissions"
    t.boolean  "books_permissions"
    t.boolean  "courses_permissions"
    t.string   "college"
    t.string   "major"
    t.string   "hobbies"
    t.string   "fav_book"
    t.string   "parent_email"
    t.string   "parent_name"
    t.integer  "sash_id"
    t.integer  "level",                           default: 0
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end
