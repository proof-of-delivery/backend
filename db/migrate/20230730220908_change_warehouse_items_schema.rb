class ChangeWarehouseItemsSchema < ActiveRecord::Migration[7.0]
  def change
    # Remove the requested_quantity and confirmed_quantity columns
    remove_column :warehouse_items, :requested_quantity, :integer
    remove_column :warehouse_items, :confirmed_quantity, :integer
    # Add the total_requested_quantity and total_confirmed_quantity columns
    change_column :warehouse_items, :total_requested_quantity, :integer, default: 0
    change_column :warehouse_items, :total_confirmed_quantity, :integer, default: 0
  end
end
