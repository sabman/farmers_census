# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080828112028) do

  create_table "answers", :force => true do |t|
    t.text     "text"
    t.integer  "question_id"
    t.integer  "survey_id"
    t.integer  "farm_id"
    t.integer  "user_id"
    t.integer  "stage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers_options", :id => false, :force => true do |t|
    t.integer "answer_id"
    t.integer "option_id"
  end

  create_table "avatars", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nominations", :force => true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "farm_name"
    t.string   "email"
    t.text     "address"
    t.string   "telephone_no"
    t.date     "date_of_birth"
    t.text     "nominees_profile"
    t.text     "nominees_contributions"
    t.string   "your_name"
    t.string   "your_email"
    t.string   "your_contact_details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", :force => true do |t|
    t.string   "text"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options_questions", :id => false, :force => true do |t|
    t.integer "question_id"
    t.integer "option_id"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "content"
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "title_label"
    t.string   "label_list"
    t.string   "text"
    t.string   "list"
    t.string   "qtype"
    t.integer  "stage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions_surveys", :id => false, :force => true do |t|
    t.integer "survey_id"
    t.integer "question_id"
  end

  create_table "stages", :force => true do |t|
    t.string   "title"
    t.string   "title_label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys_questions", :id => false, :force => true do |t|
    t.integer "survey_id"
    t.integer "question_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
