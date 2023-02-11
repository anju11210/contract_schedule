# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_07_155454) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.string "name", null: false
    t.date "date"
    t.time "time"
    t.string "place_name"
    t.string "place_address"
    t.text "description_1"
    t.text "description_2"
    t.string "preparation_thing"
    t.integer "earnest_money", default: 0, null: false
    t.integer "brokerage_fee", default: 0, null: false
    t.integer "revenue_stamp_fee", default: 0, null: false
    t.integer "remaining_amount", default: 0, null: false
    t.integer "real_estate_tax", default: 0, null: false
    t.integer "registration_fee_1", default: 0, null: false
    t.integer "registration_fee_2", default: 0, null: false
    t.integer "renovation_fee", default: 0, null: false
    t.integer "apartment_management_fee", default: 0, null: false
    t.integer "other_expense_1", default: 0, null: false
    t.integer "other_expense_2", default: 0, null: false
    t.integer "other_expense_3", default: 0, null: false
    t.integer "other_expense_4", default: 0, null: false
    t.integer "other_expense_5", default: 0, null: false
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_appointments_on_customer_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.boolean "checked", default: false, null: false
    t.integer "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_comments_on_question_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.string "address", default: "", null: false
    t.integer "phone_number", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "is_active", default: true, null: false
    t.integer "status", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "preparations", force: :cascade do |t|
    t.string "name", null: false
    t.integer "amount"
    t.integer "price"
    t.integer "appointment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_id"], name: "index_preparations_on_appointment_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.integer "status", default: 0, null: false
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_questions_on_customer_id"
  end

  create_table "real_estates", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "price"
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_real_estates_on_customer_id"
  end

  add_foreign_key "appointments", "customers"
  add_foreign_key "comments", "questions"
  add_foreign_key "preparations", "appointments"
  add_foreign_key "questions", "customers"
  add_foreign_key "real_estates", "customers"
end
