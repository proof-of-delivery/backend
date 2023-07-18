class CreateWarehouseItems < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouse_items do |t|
      t.references :warehouse_order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.integer :requested_quantity
      t.integer :confirmed_quantity
      t.integer :total_requested_quantity
      t.integer :total_confirmed_quantity
      t.integer :picked_up_quantity

      t.timestamps
    end
  end
end
