class PickupItem < ApplicationRecord
  belongs_to :pickup_order
  belongs_to :item
  belongs_to :warehouse_item

  validates :quantity, presence: true
end
