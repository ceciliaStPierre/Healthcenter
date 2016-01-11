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

ActiveRecord::Schema.define(version: 20140212231427) do

  create_table "activities", force: true do |t|
    t.text     "description"
    t.boolean  "is_done",       default: false
    t.text     "observations"
    t.string   "activity_type"
    t.date     "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "plan_id"
  end

  add_index "activities", ["plan_id"], name: "index_activities_on_plan_id"

  create_table "activities_users", id: false, force: true do |t|
    t.integer "activity_id"
    t.integer "user_id"
  end

  add_index "activities_users", ["activity_id", "user_id"], name: "index_activities_users_on_activity_id_and_user_id", unique: true

  create_table "conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "family_groups", force: true do |t|
    t.string   "family_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "index_patient_id"
  end

  create_table "family_groups_patients", id: false, force: true do |t|
    t.integer "family_group_id"
    t.integer "patient_id"
  end

  add_index "family_groups_patients", ["family_group_id", "patient_id"], name: "index_family_groups_patients_on_family_group_id_and_patient_id", unique: true

  create_table "notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "notifications", ["conversation_id"], name: "index_notifications_on_conversation_id"

  create_table "objectives", force: true do |t|
    t.string   "description"
    t.boolean  "is_done"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_id"
  end

  add_index "objectives", ["activity_id"], name: "index_objectives_on_activity_id"

  create_table "patients", force: true do |t|
    t.string   "firstname",          limit: 100,              null: false
    t.string   "father_lastname",    limit: 100,              null: false
    t.string   "mother_lastname",    limit: 100,              null: false
    t.date     "born_date",                                   null: false
    t.string   "sex",                                         null: false
    t.string   "genogram_url"
    t.string   "record_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "risk_details",                   default: ""
    t.text     "protection_details",             default: ""
    t.text     "risk_factor",                    default: ""
    t.text     "diseases",                       default: ""
  end

  create_table "plans", force: true do |t|
    t.text     "family_summary"
    t.text     "clinical_objective"
    t.string   "risk_factor"
    t.string   "state"
    t.text     "close_reason"
    t.datetime "close_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "family_group_id"
    t.text     "risk_details",       default: ""
    t.text     "protection_details", default: ""
  end

  add_index "plans", ["family_group_id"], name: "index_plans_on_family_group_id"
  add_index "plans", ["user_id"], name: "index_plans_on_user_id"

  create_table "receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "receipts", ["notification_id"], name: "index_receipts_on_notification_id"

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "secondname",                    default: ""
    t.string   "father_lastname"
    t.string   "mother_lastname",               default: ""
    t.integer  "phone_number",        limit: 8, default: 0
    t.string   "speciality",                    default: ""
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_admin",                      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "updating_password",             default: false
    t.string   "program",                       default: ""
    t.string   "sector",                        default: ""
  end

  create_table "planlogs", force: true do |t|
    t.integer "user_id"
    t.integer "family_group_id"
    t.integer "activity_id"
    t.datetime "timestamp"
  end

end
