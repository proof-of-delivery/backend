class AddPickupOrderIdToPackagingDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :packaging_details, :pickup_order_id, :integer
    add_index :packaging_details, :pickup_order_id
  end
end
