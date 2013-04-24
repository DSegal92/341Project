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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130424004818) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "artists_musics", :id => false, :force => true do |t|
    t.integer "music_id"
    t.integer "artist_id"
  end

  add_index "artists_musics", ["artist_id", "music_id"], :name => "index_artists_musics_on_artist_id_and_music_id"
  add_index "artists_musics", ["music_id", "artist_id"], :name => "index_artists_musics_on_music_id_and_artist_id"

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "authors_books", :id => false, :force => true do |t|
    t.integer "book_id"
    t.integer "author_id"
  end

  add_index "authors_books", ["author_id", "book_id"], :name => "index_authors_books_on_author_id_and_book_id"
  add_index "authors_books", ["book_id", "author_id"], :name => "index_authors_books_on_book_id_and_author_id"

  create_table "books", :force => true do |t|
    t.string   "title"
    t.integer  "year"
    t.text     "comments"
    t.integer  "rating"
    t.string   "genre"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "person_id"
    t.integer  "author_id"
  end

  create_table "directors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "directors_movies", :id => false, :force => true do |t|
    t.integer "movie_id"
    t.integer "director_id"
  end

  add_index "directors_movies", ["director_id", "movie_id"], :name => "index_directors_movies_on_director_id_and_movie_id"
  add_index "directors_movies", ["movie_id", "director_id"], :name => "index_directors_movies_on_movie_id_and_director_id"

  create_table "games", :force => true do |t|
    t.string   "title"
    t.integer  "year"
    t.string   "genre"
    t.text     "description"
    t.text     "comments"
    t.integer  "rating"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "person_id"
    t.integer  "studio_id"
  end

  create_table "games_studios", :id => false, :force => true do |t|
    t.integer "studio_id"
    t.integer "game_id"
  end

  add_index "games_studios", ["game_id", "studio_id"], :name => "index_games_studios_on_game_id_and_studio_id"
  add_index "games_studios", ["studio_id", "game_id"], :name => "index_games_studios_on_studio_id_and_game_id"

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.integer  "rating"
    t.string   "genre"
    t.integer  "year"
    t.text     "description"
    t.text     "comments"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "person_id"
    t.integer  "director_id"
  end

  create_table "movies_directors", :id => false, :force => true do |t|
    t.integer "movie_id"
    t.integer "director_id"
  end

  add_index "movies_directors", ["director_id", "movie_id"], :name => "index_movies_directors_on_director_id_and_movie_id"
  add_index "movies_directors", ["movie_id", "director_id"], :name => "index_movies_directors_on_movie_id_and_director_id"

  create_table "musics", :force => true do |t|
    t.string   "title"
    t.integer  "rating"
    t.string   "format"
    t.string   "genre"
    t.text     "tracks"
    t.integer  "year"
    t.text     "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "person_id"
    t.integer  "artist_id"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "studios", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "studios_games", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "studio_id"
  end

  add_index "studios_games", ["game_id", "studio_id"], :name => "index_studios_games_on_game_id_and_studio_id"
  add_index "studios_games", ["studio_id", "game_id"], :name => "index_studios_games_on_studio_id_and_game_id"

end
