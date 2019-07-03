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

ActiveRecord::Schema.define(version: 20190703095454) do

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
    t.string "balance_amount"
    t.string "insurance_name"
    t.string "user_allocation"
    t.string "associate_id"
  end

end
