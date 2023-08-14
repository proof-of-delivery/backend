class AddStatusToWarehouseItems < ActiveRecord::Migration[7.0]
  def change
    add_column :warehouse_items, :status, :string, default: "waiting_approval"
  end
end
