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

ActiveRecord::Schema.define(version: 2021_02_13_161643) do

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "show_id"
    t.bigint "user_id"
    t.string "booking_number"
    t.decimal "amount_paid", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_bookings_on_show_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cinemas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "genre", null: false
    t.datetime "release_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "cinema_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinema_id"], name: "index_screens_on_cinema_id"
  end

  create_table "seats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "cinema_id"
    t.bigint "screen_id"
    t.bigint "user_id"
    t.integer "timing"
    t.integer "seats_left", default: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinema_id"], name: "index_shows_on_cinema_id"
    t.index ["movie_id"], name: "index_shows_on_movie_id"
    t.index ["screen_id"], name: "index_shows_on_screen_id"
    t.index ["user_id"], name: "index_shows_on_user_id"
  end

  create_table "tickets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "user_id"
    t.integer "seat_info"
    t.integer "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_tickets_on_booking_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
