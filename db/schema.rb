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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130604115102) do

  create_table "background_jobs", :force => true do |t|
    t.text     "job"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], :name => "index_categories_on_name"

  create_table "categories_notes", :force => true do |t|
    t.integer  "note_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories_notes", ["category_id"], :name => "index_categories_notes_on_category_id"
  add_index "categories_notes", ["note_id"], :name => "index_categories_notes_on_note_id"

  create_table "content_indices", :force => true do |t|
    t.string  "word"
    t.integer "note_id"
  end

  add_index "content_indices", ["note_id"], :name => "index_content_indices_on_note_id"
  add_index "content_indices", ["word"], :name => "index_content_indices_on_word"

  create_table "notes", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations", :force => true do |t|
    t.string   "operation"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", :force => true do |t|
    t.string "word"
    t.string "kind"
  end

end
