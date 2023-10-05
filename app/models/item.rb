# frozen_string_literal: true

class Item < ApplicationRecord
  validates :position, :item_no, :description, :sales_order_no, :unit, presence: true
  validates :position, numericality: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[position item_no description sales_order_no unit id created_at updated_at]
  end
end
