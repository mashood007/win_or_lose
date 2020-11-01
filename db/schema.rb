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

ActiveRecord::Schema.define(version: 2020_11_01_080659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_hotels_on_player_id"
    t.index ["step_id"], name: "index_hotels_on_step_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "game_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_players_on_game_id"
  end

  create_table "scorecards", force: :cascade do |t|
    t.bigint "player_id"
    t.integer "dice"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_scorecards_on_game_id"
    t.index ["player_id"], name: "index_scorecards_on_player_id"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "game_id"
    t.string "title", limit: 1
    t.float "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_steps_on_game_id"
  end

  add_foreign_key "hotels", "players"
  add_foreign_key "hotels", "steps"
  add_foreign_key "players", "games"
  add_foreign_key "scorecards", "games"
  add_foreign_key "scorecards", "players"
  add_foreign_key "steps", "games"
end
