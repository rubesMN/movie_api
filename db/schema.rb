# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_04_221942) do

  create_table "actors", id: { type: :binary, limit: 16 }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.binary "favorite_movie_id", limit: 16
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "trade_mark"
    t.index ["favorite_movie_id"], name: "index_actors_on_favorite_movie_id"
  end

  create_table "movies", id: { type: :binary, limit: 16 }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.string "imdb_url"
    t.binary "creator_id", limit: 16, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_movies_on_creator_id"
  end

  create_table "movies_actors", id: { type: :binary, limit: 16 }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.binary "movie_id", limit: 16
    t.binary "actor_id", limit: 16
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_movies_actors_on_actor_id"
    t.index ["movie_id"], name: "index_movies_actors_on_movie_id"
  end

  create_table "people", id: { type: :binary, limit: 16 }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "personable_type"
    t.binary "personable_id", limit: 16
    t.index ["personable_type", "personable_id"], name: "index_people_on_personable"
  end

  add_foreign_key "movies", "people", column: "creator_id"
  add_foreign_key "movies_actors", "actors"
  add_foreign_key "movies_actors", "movies"
end
