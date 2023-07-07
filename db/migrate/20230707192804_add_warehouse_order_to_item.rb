class AddWarehouseOrderToItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :warehouse_order, null: false, foreign_key: true
  end
end
