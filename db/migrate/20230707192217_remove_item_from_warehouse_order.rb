class RemoveItemFromWarehouseOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :warehouse_orders, :item_id
  end
end
