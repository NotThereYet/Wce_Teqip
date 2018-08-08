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

ActiveRecord::Schema.define(version: 20180416061646) do

  create_table "activities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "desc"
    t.date "event_date"
    t.string "attachment"
  end

  create_table "admindetails", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "desc"
  end

  create_table "profdetails", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "branch"
    t.string "gender"
    t.string "contact_no"
    t.string "address"
    t.integer "user_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.integer "user_id"
    t.string "proposer_name"
    t.string "proposer_type", null: false
    t.string "title", default: "TITLE", null: false
    t.text "desc", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "approved", default: "No", null: false
    t.string "sanctioned", default: "No", null: false
    t.integer "requested_amount", default: 0
    t.integer "sanctioned_amount", default: 0, null: false
    t.string "attachment", default: ""
    t.text "sanction_summary"
    t.integer "course_fees", default: 0, null: false
    t.integer "travel", default: 0, null: false
    t.integer "lodging", default: 0, null: false
    t.integer "sundry", default: 0, null: false
    t.integer "trainer_fee", default: 0, null: false
    t.integer "hospitality", default: 0, null: false
    t.string "others_reason"
    t.integer "others_fees", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "proposal_type", default: "", null: false
    t.string "branch"
    t.string "year"
    t.string "cancelled", default: "No", null: false
    t.string "submit_bill", default: "No"
    t.string "debited_to_acc", default: "No"
    t.integer "course_fees_sanctioned", default: 0, null: false
    t.integer "travel_sanctioned", default: 0, null: false
    t.integer "lodging_sanctioned", default: 0, null: false
    t.integer "sundry_sanctioned", default: 0, null: false
    t.integer "trainer_fee_sanctioned", default: 0, null: false
    t.integer "hospitality_sanctioned", default: 0, null: false
    t.integer "others_fees_sanctioned", default: 0, null: false
    t.text "conclusion"
    t.text "expectations"
    t.integer "express_fees", default: 0
    t.text "express_reason"
    t.integer "publication_fee", default: 0, null: false
    t.integer "patenting_fee", default: 0, null: false
    t.integer "project_fee", default: 0, null: false
    t.integer "thesis_fee", default: 0, null: false
    t.integer "consumables_fee", default: 0, null: false
    t.integer "qualification_fee", default: 0, null: false
    t.integer "consumables_fee_sanctioned", default: 0, null: false
    t.integer "qualification_fee_sanctioned", default: 0, null: false
    t.integer "publication_fee_sanctioned", default: 0, null: false
    t.integer "patenting_fee_sanctioned", default: 0, null: false
    t.integer "project_fee_sanctioned", default: 0, null: false
    t.integer "thesis_fee_sanctioned", default: 0, null: false
  end

  create_table "studentdetails", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "year"
    t.string "branch"
    t.string "prn"
    t.string "gender"
    t.string "contact_no"
    t.string "address"
    t.integer "user_id"
    t.date "dob"
  end

  create_table "tdocuments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "t_docs"
    t.string "t_comp"
    t.string "t_video"
  end

  create_table "users", force: :cascade do |t|
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
    t.string "full_name"
    t.string "active_admin", default: "no"
    t.string "username"
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
