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

ActiveRecord::Schema[7.0].define(version: 2023_07_20_183618) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "primary_contact_id", null: false
    t.bigint "billing_contact_id", null: false
    t.index ["billing_contact_id"], name: "billing_indx"
    t.index ["primary_contact_id"], name: "primary_indx"
  end

  create_table "items", force: :cascade do |t|
    t.integer "position", null: false
    t.string "item_no", null: false
    t.string "description", null: false
    t.string "sales_order_no", null: false
    t.string "unit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pickup_items", force: :cascade do |t|
    t.bigint "pickup_order_id", null: false
    t.bigint "item_id", null: false
    t.bigint "warehouse_order_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_pickup_items_on_item_id"
    t.index ["pickup_order_id"], name: "index_pickup_items_on_pickup_order_id"
    t.index ["warehouse_order_id"], name: "index_pickup_items_on_warehouse_order_id"
  end

  create_table "pickup_orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "pickup_date", null: false
    t.string "pickup_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_pickup_orders_on_customer_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "warehouse_items", force: :cascade do |t|
    t.bigint "warehouse_order_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity", null: false
    t.integer "requested_quantity"
    t.integer "confirmed_quantity"
    t.integer "total_requested_quantity"
    t.integer "total_confirmed_quantity"
    t.integer "picked_up_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_warehouse_items_on_item_id"
    t.index ["warehouse_order_id"], name: "index_warehouse_items_on_warehouse_order_id"
  end

  create_table "warehouse_orders", force: :cascade do |t|
    t.string "doc_no", null: false
    t.string "name_of_ship"
    t.datetime "delivery_date"
    t.string "delivery_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id", null: false
    t.index ["customer_id"], name: "index_warehouse_orders_on_customer_id"
  end

  add_foreign_key "customers", "contacts", column: "billing_contact_id"
  add_foreign_key "customers", "contacts", column: "primary_contact_id"
  add_foreign_key "pickup_items", "items"
  add_foreign_key "pickup_items", "pickup_orders"
  add_foreign_key "pickup_items", "warehouse_orders"
  add_foreign_key "pickup_orders", "customers"
  add_foreign_key "warehouse_items", "items"
  add_foreign_key "warehouse_items", "warehouse_orders"
  add_foreign_key "warehouse_orders", "customers"
end
