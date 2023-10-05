# frozen_string_literal: true

class WarehouseItem < ApplicationRecord
  belongs_to :warehouse_order
  belongs_to :item

  validates :quantity, presence: true
  validates :quantity, :total_confirmed_quantity, :total_requested_quantity, :picked_up_quantity, numericality: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[warehouse_order_id item_id quantity total_requested_quantity total_confirmed_quantity
       picked_up_quantity id created_at updated_at]
  end

  def request_quantity(requested_quantity)
    available_to_request = quantity - total_confirmed_quantity
    if requested_quantity > available_to_request
      errors.add(:base, 'Requested quantity cannot be greater than available quantity')
      false
    else
      self.total_requested_quantity += requested_quantity
      save
    end
  end

  def confirm_quantity(confirmed_quantity)
    available_to_confirm = total_requested_quantity
    if confirmed_quantity > available_to_confirm
      errors.add(:base, 'Confirmed quantity cannot be greater than available quantity')
      false
    else
      self.class.transaction do
        self.total_confirmed_quantity += confirmed_quantity
        self.total_requested_quantity -= confirmed_quantity
        save!
      end
    end
  end
end
