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

ActiveRecord::Schema.define(:version => 20110613035044) do

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.boolean  "payed"
    t.boolean  "discount"
    t.boolean  "exemption"
    t.string   "paymethod"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", :force => true do |t|
    t.string   "title"
    t.integer  "price"
    t.integer  "period"
    t.integer  "term"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "phone_number"
    t.datetime "birthday"
    t.string   "group"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
