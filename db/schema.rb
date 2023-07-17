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

ActiveRecord::Schema[7.0].define(version: 2023_07_17_130154) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "primary_contact", null: false
    t.string "billing_contact", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "warehouse_orders", force: :cascade do |t|
    t.string "doc_no", null: false
    t.string "date"
    t.string "purchase_order_no", null: false
    t.string "name_of_ship"
    t.string "delivery_date"
    t.string "delivery_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id", null: false
    t.index ["customer_id"], name: "index_warehouse_orders_on_customer_id"
  end

  add_foreign_key "items", "warehouse_orders"
  add_foreign_key "warehouse_orders", "customers"
end
