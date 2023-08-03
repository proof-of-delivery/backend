class WarehouseItem < ApplicationRecord
  belongs_to :warehouse_order
  belongs_to :item

  validates :quantity, presence: true
  validates :quantity, :total_confirmed_quantity, :total_requested_quantity, :picked_up_quantity, numericality: true

  def self.ransackable_attributes(auth_object = nil)
    ['warehouse_order_id', 'item_id', 'quantity','total_requested_quantity', 'total_confirmed_quantity', 'picked_up_quantity', 'id', 'created_at', 'updated_at']
  end

  def request_quantity(requested_quantity)
    available_to_request = quantity - total_confirmed_quantity
    quantity
    requested_quantity = available_to_request if requested_quantity > available_to_request
    self.total_requested_quantity += requested_quantity
    self.save
  end

  def confirm_quantity(confirmed_quantity)
    quantity
    confirmed_quantity = available_to_confirm if confirmed_quantity > available_to_confirm
    self.total_confirmed_quantity += confirmed_quantity
    self.save
  end
  
end
