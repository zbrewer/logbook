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

ActiveRecord::Schema.define(version: 20150414064017) do

  create_table "airplanes", force: :cascade do |t|
    t.string   "identification"
    t.boolean  "complex",            default: false
    t.boolean  "high_performance",   default: false
    t.boolean  "tailwheel",          default: false
    t.boolean  "high_altitude",      default: false
    t.boolean  "turbine",            default: false
    t.boolean  "glider",             default: false
    t.boolean  "rotorcraft",         default: false
    t.boolean  "powered_lift",       default: false
    t.boolean  "lighter_than_air",   default: false
    t.boolean  "single_engine_land", default: false
    t.boolean  "single_engine_sea",  default: false
    t.boolean  "multi_engine_land",  default: false
    t.boolean  "multi_engine_sea",   default: false
    t.boolean  "simulator",          default: false
    t.string   "display_name"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "airplane_type"
    t.integer  "user_id"
  end

  add_index "airplanes", ["user_id"], name: "index_airplanes_on_user_id"

  create_table "checkrides", force: :cascade do |t|
    t.date     "checkride_date"
    t.string   "examiner_name"
    t.boolean  "cfi",                default: false
    t.boolean  "cfii",               default: false
    t.boolean  "instrument",         default: false
    t.boolean  "certificate",        default: false
    t.string   "certificate_type",   default: "f"
    t.boolean  "single_engine_land", default: false
    t.boolean  "single_engine_sea",  default: false
    t.boolean  "multi_engine_land",  default: false
    t.boolean  "multi_engine_sea",   default: false
    t.boolean  "rotorcraft",         default: false
    t.boolean  "glider",             default: false
    t.boolean  "powered_lift",       default: false
    t.boolean  "lighter_than_air",   default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "flight_id"
  end

  add_index "checkrides", ["flight_id"], name: "index_checkrides_on_flight_id"

  create_table "endorsements", force: :cascade do |t|
    t.date     "endorsement_date"
    t.string   "cfi_name"
    t.integer  "cfi_certificate_number"
    t.date     "cfi_expiration_date"
    t.boolean  "complex",                default: false
    t.boolean  "high_performance",       default: false
    t.boolean  "tailwheel",              default: false
    t.boolean  "high_altitude",          default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "user_id"
  end

  add_index "endorsements", ["user_id"], name: "index_endorsements_on_user_id"

  create_table "flights", force: :cascade do |t|
    t.date     "flight_date"
    t.decimal  "total_time",           default: 0.0
    t.decimal  "pic_time",             default: 0.0
    t.decimal  "sic_time",             default: 0.0
    t.decimal  "dual_received",        default: 0.0
    t.decimal  "dual_given",           default: 0.0
    t.integer  "day_landings",         default: 0
    t.integer  "night_landings",       default: 0
    t.decimal  "actual_instrument",    default: 0.0
    t.decimal  "simulated_instrument", default: 0.0
    t.integer  "number_approaches",    default: 0
    t.integer  "number_holds",         default: 0
    t.text     "remarks"
    t.string   "departure_airport"
    t.string   "destination_airports"
    t.decimal  "night_time",           default: 0.0
    t.decimal  "cross_country_time",   default: 0.0
    t.decimal  "solo_time",            default: 0.0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "airplane_id"
  end

  add_index "flights", ["airplane_id"], name: "index_flights_on_airplane_id"

  create_table "medicals", force: :cascade do |t|
    t.date     "exam_date"
    t.string   "examiner_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "medical_class"
    t.integer  "user_id"
  end

  add_index "medicals", ["user_id"], name: "index_medicals_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.date     "review_date"
    t.string   "name_of_reviewer"
    t.boolean  "flight_review",                default: false
    t.boolean  "instrument_proficiency_check", default: false
    t.boolean  "cfi_renewal",                  default: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "flight_id"
  end

  add_index "reviews", ["flight_id"], name: "index_reviews_on_flight_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.integer  "certificate_number"
    t.string   "certificate_type"
    t.date     "certificate_issue_date"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
