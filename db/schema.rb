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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130505193803) do

  create_table "answers", :force => true do |t|
    t.integer  "agree"
    t.integer  "importance"
    t.string   "comments"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "candidates", :force => true do |t|
    t.integer  "userid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.text "not_selected"
    t.text "name"
    t.text "pic"
    t.text "small_pic"
  end

  create_table "political_infos", :force => true do |t|
    t.integer  "candidateid"
    t.integer  "partyid"
    t.integer  "positionid"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "cat1"
    t.string   "cat2"
    t.string   "cat3"
    t.string   "cat4"
    t.string   "cat5"
    t.string   "cat7"
    t.string   "cat6"
    t.string   "cat8"
    t.string   "cat9"
    t.string   "cat10"
    t.string   "cat11"
    t.string   "cat12"
    t.string   "cat13"
    t.string   "cat14"
    t.string   "cat15"
    t.string   "cat16"
    t.string   "cat17"
    t.string   "cat18"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :primary_key => "question_id", :force => true do |t|
    t.text    "category_id"
    t.decimal "question_num"
    t.text    "question"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
