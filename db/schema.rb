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

ActiveRecord::Schema.define(version: 2021_07_08_222553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "years_experience"
    t.boolean "comissions_open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artworks", force: :cascade do |t|
    t.string "name"
    t.string "art_type"
    t.integer "price"
    t.boolean "for_sale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "artist_id"
    t.index ["artist_id"], name: "index_artworks_on_artist_id"
  end

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "style"
    t.float "abv"
    t.integer "ibu"
    t.boolean "non_alcoholic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brewery_id"
    t.index ["brewery_id"], name: "index_beers_on_brewery_id"
  end

  create_table "breweries", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "year_established"
    t.boolean "multiple_brewhouses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "artworks", "artists"
  add_foreign_key "beers", "breweries"
end
