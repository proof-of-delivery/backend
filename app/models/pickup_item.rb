class PickupItem < ApplicationRecord
  belongs_to :pickup_order
  belongs_to :item
  belongs_to :warehouse_item

  validates :quantity, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ['pickup_order_id', 'item_id', 'quantity', 'warehouse_item_id', 'id', 'created_at', 'updated_at']
  end

end
