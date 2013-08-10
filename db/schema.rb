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

ActiveRecord::Schema.define(:version => 20130714034024) do

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "organisation"
    t.integer  "year_started"
    t.integer  "year_finished"
    t.text     "content"
    t.boolean  "publish"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "month_started",  :default => 0
    t.integer  "month_finished", :default => 0
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "content"
    t.boolean  "publish"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "content"
    t.string   "screenshot"
    t.string   "website_url"
    t.string   "download_url"
    t.string   "source_code_url"
    t.boolean  "publish"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "priority",        :default => 0
  end

  create_table "qualifications", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "education_provider"
    t.integer  "year_completed"
    t.text     "content"
    t.string   "certificate"
    t.boolean  "publish"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "email_address"
    t.string   "password_digest"
    t.string   "authentication_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "role"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

end
