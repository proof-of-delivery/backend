class WarehouseItem < ApplicationRecord
  belongs_to :warehouse_order
  belongs_to :item

  validates :quantity, presence: true
  validates :quantity, :requested_quantity, :confirmed_quantity, :total_confirmed_quantity, :total_requested_quantity, :picked_up_quantity, numericality: true
end
