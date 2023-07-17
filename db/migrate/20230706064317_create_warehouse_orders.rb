class CreateWarehouseOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouse_orders do |t|
      t.string :customer_address
      t.string :doc_no, null: false
      t.string :date
      t.string :customer_id
      t.string :assistance
      t.string :email
      t.string :purchase_order_no, null: false
      t.string :name_of_ship
      t.string :delivery_date
      t.string :delivery_address
      t.string :voyage_no
      t.string :weight_package
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
