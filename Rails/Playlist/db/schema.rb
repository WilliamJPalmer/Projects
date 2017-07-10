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

ActiveRecord::Schema.define(version: 20170603202830) do

  create_table "songs", force: :cascade do |t|
    t.string   "artist"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "count"
  end

  create_table "userplaylists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.integer  "add"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "userplaylists", ["song_id"], name: "index_userplaylists_on_song_id"
  add_index "userplaylists", ["user_id"], name: "index_userplaylists_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
