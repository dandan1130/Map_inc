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

ActiveRecord::Schema.define(version: 20200329035500) do

  create_table "parks", force: :cascade do |t|
    t.string   "park_title"
    t.string   "park_address"
    t.text     "park_discription"
    t.string   "park_phone_number"
    t.string   "station"
    t.decimal  "east"
    t.decimal  "west"
    t.string   "park_image"
    t.string   "park_url"
    t.boolean  "park_admin"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "shops", force: :cascade do |t|
    t.integer  "park_id"
    t.string   "shop_name"
    t.string   "shop_discription"
    t.string   "shop_phone_number"
    t.string   "shop_image"
    t.string   "floor"
    t.string   "category"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["park_id"], name: "index_shops_on_park_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "phone_number"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_digest"
  end

end
