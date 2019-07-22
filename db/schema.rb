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

ActiveRecord::Schema.define(version: 20190720120802) do

  create_table "associate_production_reports", force: :cascade do |t|
    t.string "date"
    t.integer "daily_target"
    t.integer "daily_achieved"
    t.integer "mtd_target"
    t.integer "mtd_achieved"
    t.string "mtd_achieved_percentage"
    t.integer "deficit"
    t.string "associate_id"
    t.string "associate_name"
    t.string "project_name"
  end

  create_table "associate_reports", force: :cascade do |t|
    t.string "date"
    t.integer "daily_target"
    t.integer "daily_achieved"
    t.integer "mtd_target"
    t.integer "mtd_achieved"
    t.string "mtd_achieved_percentage"
    t.integer "deficit"
    t.string "associate_name"
    t.string "associate_id"
    t.string "project_name"
  end

  create_table "associates", force: :cascade do |t|
    t.string "associate_id"
    t.string "associate_name"
    t.string "project_name"
    t.string "password_digest"
    t.string "access"
  end

  create_table "atbs", force: :cascade do |t|
    t.string "encounter_no"
    t.string "patient_name"
    t.string "admit_date"
    t.string "discharge_date"
    t.string "billed_amount"
    t.float "balance_amount"
    t.string "insurance_name"
    t.string "user_allocation"
    t.string "associate_id"
  end

  create_table "daily_targets", force: :cascade do |t|
    t.string "project_name"
    t.integer "target"
  end

  create_table "ems", force: :cascade do |t|
    t.string "status"
    t.string "action"
    t.string "rm_checked"
    t.string "cpdi"
    t.string "clearing_house"
    t.string "website_checked"
    t.string "self_resolvable"
    t.string "source_of_resolution"
  end

  create_table "master_atbs", force: :cascade do |t|
    t.string "encounter_no"
    t.string "patient_name"
    t.string "admit_date"
    t.string "discharge_date"
    t.string "billed_amount"
    t.string "balance_amount"
    t.string "insurance_name"
    t.string "created_at"
    t.string "updated_at"
    t.string "user_allocation"
    t.string "associate_id"
  end

  create_table "workstations", force: :cascade do |t|
    t.string "encounter_no"
    t.string "patient_name"
    t.string "admit_date"
    t.string "discharge_date"
    t.string "billed_amount"
    t.string "balance_amount"
    t.string "insurance_name"
    t.string "user_allocation"
    t.string "associate_id"
    t.string "notes"
    t.string "status_code"
    t.string "action_code"
    t.string "date"
    t.string "rm_checked"
    t.string "cpdi"
    t.string "clearing_house"
    t.string "website_checked"
    t.string "self_resolution"
    t.string "source_of_resolution"
    t.string "work_status"
  end

end
