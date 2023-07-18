class CreateWarehouseOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouse_orders do |t|
      t.string :doc_no, null: false
      t.string :purchase_order_no, null: false
      t.string :name_of_ship
      t.datetime :delivery_date
      t.string :delivery_address

      t.timestamps
    end
  end
end
