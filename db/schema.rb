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

ActiveRecord::Schema.define(version: 20140929170354) do

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "cfid"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "long_name"
    t.integer  "credit_hours"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.string   "cfid"
    t.integer  "institution_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "long_name"
  end

  create_table "institutions", force: true do |t|
    t.string   "name"
    t.string   "cfid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructors", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "cfid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "institution_id"
  end

  create_table "sections", force: true do |t|
    t.string   "start_time"
    t.string   "end_time"
    t.string   "cfid"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_enrollment"
    t.integer  "enrollment_limit"
    t.integer  "location_id"
    t.integer  "instructor_id"
    t.integer  "semester_id"
    t.string   "mode_of_instruction"
    t.boolean  "monday",              default: false
    t.boolean  "tuesday",             default: false
    t.boolean  "wednesday",           default: false
    t.boolean  "thursday",            default: false
    t.boolean  "friday",              default: false
    t.boolean  "saturday",            default: false
    t.boolean  "sunday",              default: false
  end

  create_table "semesters", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
