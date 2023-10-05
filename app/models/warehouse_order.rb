# frozen_string_literal: true

class WarehouseOrder < ApplicationRecord
  belongs_to :customer
  has_many :warehouse_item
  validates :doc_no, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[doc_no name_of_ship delivery_date delivery_address customer_id id created_at updated_at]
  end
end
