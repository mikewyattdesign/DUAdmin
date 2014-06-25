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

ActiveRecord::Schema.define(version: 20140625204803) do

  create_table "entrants", force: true do |t|
    t.string   "guid"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.date     "birthdate"
    t.string   "street_address"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", force: true do |t|
    t.integer  "entrant_id"
    t.string   "entrant_guid"
    t.string   "s3_uri"
    t.date     "date_created"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.boolean  "processed",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["entrant_id"], name: "index_entries_on_entrant_id"

end
