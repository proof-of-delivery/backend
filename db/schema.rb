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

ActiveRecord::Schema[7.0].define(version: 2023_07_08_045031) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.integer "position", null: false
    t.integer "item_no", null: false
    t.string "description", null: false
    t.string "supplier_item_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "warehouse_order_id", null: false
    t.index ["warehouse_order_id"], name: "index_items_on_warehouse_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "user_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warehouse_orders", force: :cascade do |t|
    t.string "customer_address", null: false
    t.string "doc_no", null: false
    t.string "date"
    t.string "customer_id", null: false
    t.string "assistance"
    t.string "email"
    t.string "purchase_order_no", null: false
    t.string "name_of_ship"
    t.string "delivery_date"
    t.string "delivery_address"
    t.string "voyage_no"
    t.string "weight_package"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "warehouse_orders"
end
