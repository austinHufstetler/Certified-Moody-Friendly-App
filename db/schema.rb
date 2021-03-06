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

ActiveRecord::Schema.define(version: 20180502152944) do

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "accountable_type"
    t.integer "accountable_id"
    t.boolean "approved", default: false, null: false
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id"
    t.index ["approved"], name: "index_accounts_on_approved"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "logo_url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.date "expiration", default: "2019-05-03"
    t.string "website"
  end

  create_table "chambers", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "business_id"
    t.string "category"
    t.integer "popularity", default: 0
    t.index ["business_id"], name: "index_coupons_on_business_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "business_id"
    t.string "address"
    t.string "fblink"
    t.integer "popularity"
    t.index ["business_id"], name: "index_events_on_business_id"
  end

  create_table "militaries", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "branch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reportable_type"
    t.integer "reportable_id"
    t.string "email"
    t.integer "count", default: 0
    t.index ["reportable_type", "reportable_id"], name: "index_reports_on_reportable_type_and_reportable_id"
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
