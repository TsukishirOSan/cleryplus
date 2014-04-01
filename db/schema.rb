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

ActiveRecord::Schema.define(version: 20140401220737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assault_stats", force: true do |t|
    t.string   "name"
    t.integer  "forcible"
    t.integer  "non_forcible"
    t.integer  "total"
    t.integer  "survey_year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assault_stats", ["name"], name: "index_assault_stats_on_name", using: :btree
  add_index "assault_stats", ["survey_year_id"], name: "index_assault_stats_on_survey_year_id", using: :btree

  create_table "campus", force: true do |t|
    t.string   "name"
    t.integer  "institution_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "state"
  end

  add_index "campus", ["city"], name: "index_campus_on_city", using: :btree
  add_index "campus", ["institution_id"], name: "index_campus_on_institution_id", using: :btree
  add_index "campus", ["name"], name: "index_campus_on_name", using: :btree
  add_index "campus", ["state"], name: "index_campus_on_state", using: :btree

  create_table "institutions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "institutions", ["name"], name: "index_institutions_on_name", using: :btree

  create_table "survey_years", force: true do |t|
    t.integer  "name"
    t.integer  "campus_id"
    t.integer  "men_total"
    t.integer  "women_total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.string   "zip"
    t.integer  "total"
  end

  add_index "survey_years", ["campus_id"], name: "index_survey_years_on_campus_id", using: :btree
  add_index "survey_years", ["name"], name: "index_survey_years_on_name", using: :btree

end
