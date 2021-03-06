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

ActiveRecord::Schema.define(version: 20170912201404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fights", force: :cascade do |t|
    t.integer  "perso_id"
    t.boolean  "winner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perso_id"], name: "index_fights_on_perso_id", using: :btree
  end

  create_table "persos", force: :cascade do |t|
    t.string   "name"
    t.integer  "points_of_life"
    t.integer  "attack_points"
    t.integer  "experience",     default: 0
    t.string   "picture_url"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string   "type_of_sort"
    t.string   "name"
    t.integer  "fight_id"
    t.integer  "point"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["fight_id"], name: "index_weapons_on_fight_id", using: :btree
  end

  add_foreign_key "fights", "persos"
  add_foreign_key "weapons", "fights"
end
