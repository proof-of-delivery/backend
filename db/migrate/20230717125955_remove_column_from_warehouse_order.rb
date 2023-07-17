class RemoveColumnFromWarehouseOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :warehouse_orders, :customer_address, :string
    remove_column :warehouse_orders, :customer_id, :string
    remove_column :warehouse_orders, :assistance, :string
    remove_column :warehouse_orders, :email, :string
    remove_column :warehouse_orders, :voyage_no, :string
    remove_column :warehouse_orders, :weight_package, :string
  end
end
