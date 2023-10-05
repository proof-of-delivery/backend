# frozen_string_literal: true

class PickupItem < ApplicationRecord
  belongs_to :pickup_order
  belongs_to :item
  belongs_to :warehouse_item
  has_many :packaging_items

  validates :quantity, presence: true

  after_create :update_picked_up_quantity

  def self.ransackable_attributes(_auth_object = nil)
    %w[pickup_order_id item_id quantity warehouse_item_id id created_at updated_at]
  end

  private

  def update_picked_up_quantity
    ActiveRecord::Base.transaction do
      warehouse_item.update!(
        picked_up_quantity: warehouse_item.picked_up_quantity + quantity,
        total_confirmed_quantity: warehouse_item.total_confirmed_quantity - quantity
      )
    end
  end
end
