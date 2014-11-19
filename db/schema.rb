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

ActiveRecord::Schema.define(version: 20141118032451) do

  create_table "blogs", force: true do |t|
    t.string   "title",      null: false
    t.string   "content"
    t.binary   "program"
    t.binary   "reference"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "userid"
  end

  create_table "userprofiles", force: true do |t|
    t.integer  "userid",     null: false
    t.string   "name",       null: false
    t.string   "bloodtype"
    t.datetime "birthday"
    t.string   "address"
    t.binary   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ptype"
    t.string   "pname"
  end

  create_table "users", force: true do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "passwd",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
