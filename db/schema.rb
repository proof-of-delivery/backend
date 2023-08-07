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

ActiveRecord::Schema[7.0].define(version: 2023_08_07_053400) do
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

  create_table "packaging_details", force: :cascade do |t|
    t.string "package_type"
    t.float "weight", null: false
    t.float "length", null: false
    t.float "width", null: false
    t.float "height", null: false
    t.string "cbm", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packaging_items", force: :cascade do |t|
    t.bigint "packaging_detail_id", null: false
    t.bigint "pickup_item_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["packaging_detail_id"], name: "index_packaging_items_on_packaging_detail_id"
    t.index ["pickup_item_id"], name: "index_packaging_items_on_pickup_item_id"
  end

  create_table "pickup_items", force: :cascade do |t|
    t.bigint "pickup_order_id", null: false
    t.bigint "item_id", null: false
    t.bigint "warehouse_item_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_pickup_items_on_item_id"
    t.index ["pickup_order_id"], name: "index_pickup_items_on_pickup_order_id"
    t.index ["warehouse_item_id"], name: "index_pickup_items_on_warehouse_item_id"
  end

  create_table "pickup_orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "contact_id", null: false
    t.datetime "pickup_date", null: false
    t.string "pickup_time", null: false
    t.string "pickup_order_no", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_pickup_orders_on_contact_id"
    t.index ["customer_id"], name: "index_pickup_orders_on_customer_id"
  end

  create_table "pod_headers", force: :cascade do |t|
    t.bigint "pickup_order_id", null: false
    t.string "pickedup_data"
    t.datetime "pickedup_time"
    t.bigint "customer_id", null: false
    t.string "freight_forwarder"
    t.bigint "warehouse_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_pod_headers_on_customer_id"
    t.index ["pickup_order_id"], name: "index_pod_headers_on_pickup_order_id"
    t.index ["warehouse_order_id"], name: "index_pod_headers_on_warehouse_order_id"
  end

  create_table "pod_items", force: :cascade do |t|
    t.string "vessel"
    t.integer "packaging_detail_item_id"
    t.string "customs_document"
    t.bigint "pod_header_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pod_header_id"], name: "index_pod_items_on_pod_header_id"
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
    t.integer "total_requested_quantity", default: 0
    t.integer "total_confirmed_quantity", default: 0
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
  add_foreign_key "packaging_items", "packaging_details"
  add_foreign_key "packaging_items", "pickup_items"
  add_foreign_key "pickup_items", "items"
  add_foreign_key "pickup_items", "pickup_orders"
  add_foreign_key "pickup_items", "warehouse_items"
  add_foreign_key "pickup_orders", "contacts"
  add_foreign_key "pickup_orders", "customers"
  add_foreign_key "pod_headers", "customers"
  add_foreign_key "pod_headers", "pickup_orders"
  add_foreign_key "pod_headers", "warehouse_orders"
  add_foreign_key "pod_items", "pod_headers"
  add_foreign_key "warehouse_items", "items"
  add_foreign_key "warehouse_items", "warehouse_orders"
  add_foreign_key "warehouse_orders", "customers"
end
