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

ActiveRecord::Schema.define(version: 20140407193122) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.date     "established_on"
    t.string   "facebook"
    t.string   "twitter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.integer  "height"
    t.integer  "width"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.date     "released_on"
    t.decimal  "original_price"
    t.string   "gender"
    t.string   "availability"
    t.string   "exclusivity"
    t.integer  "quantity"
    t.string   "packaging_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id"
  end

  create_table "user_items", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "shelf_id"
    t.string   "status"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
