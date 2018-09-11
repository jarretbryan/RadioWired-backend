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

ActiveRecord::Schema.define(version: 2018_09_11_160035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "audio"
    t.string "episode_id"
    t.integer "audio_length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "subscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_favorites_on_subscription_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.integer "api_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "genre"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "website"
    t.string "publisher"
    t.string "title"
    t.string "country"
    t.string "image"
    t.string "rss"
    t.string "language"
    t.string "thumbnail"
    t.string "description"
    t.string "ep_id"
    t.bigint "playlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_subscriptions_on_playlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.string "profile_image", default: "https://cdn.pixabay.com/photo/2017/10/15/00/55/headphones-2852336_960_720.png"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "favorites", "subscriptions", on_delete: :cascade
  add_foreign_key "favorites", "users", on_delete: :cascade
  add_foreign_key "playlists", "users", on_delete: :cascade
  add_foreign_key "subscriptions", "playlists", on_delete: :cascade
end
