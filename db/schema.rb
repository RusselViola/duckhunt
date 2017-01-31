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

ActiveRecord::Schema.define(version: 20170131232558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.string   "name",               null: false
    t.text     "description",        null: false
    t.decimal  "price",              null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id",            null: false
    t.index ["user_id"], name: "index_listings_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "address",    null: false
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "zipcode",    null: false
    t.index ["city"], name: "index_orders_on_city", using: :btree
    t.index ["state"], name: "index_orders_on_state", using: :btree
    t.index ["zipcode"], name: "index_orders_on_zipcode", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "last_signed_in_at"
    t.string   "name"
    t.string   "oauth_uid"
    t.integer  "sign_in_count",     default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
    t.index ["oauth_uid"], name: "index_users_on_oauth_uid", unique: true, using: :btree
  end

end
