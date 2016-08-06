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

ActiveRecord::Schema.define(version: 20160920200802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dimension_translations", force: :cascade do |t|
    t.integer  "dimension_id", null: false
    t.string   "locale",       null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
  end

  add_index "dimension_translations", ["dimension_id"], name: "index_dimension_translations_on_dimension_id", using: :btree
  add_index "dimension_translations", ["locale"], name: "index_dimension_translations_on_locale", using: :btree

  create_table "dimensions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "element_translations", force: :cascade do |t|
    t.integer  "element_id",  null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  add_index "element_translations", ["element_id"], name: "index_element_translations_on_element_id", using: :btree
  add_index "element_translations", ["locale"], name: "index_element_translations_on_locale", using: :btree

  create_table "elements", force: :cascade do |t|
    t.integer  "dimension_id", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "scene_translations", force: :cascade do |t|
    t.integer  "scene_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  add_index "scene_translations", ["locale"], name: "index_scene_translations_on_locale", using: :btree
  add_index "scene_translations", ["scene_id"], name: "index_scene_translations_on_scene_id", using: :btree

  create_table "scenes", force: :cascade do |t|
    t.integer  "interval",   default: 30, null: false
    t.integer  "length",     default: 0,  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
