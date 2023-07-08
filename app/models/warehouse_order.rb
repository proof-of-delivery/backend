class WarehouseOrder < ApplicationRecord
  has_many :items
  validates :customer_address, :doc_no, :customer_id, :purchase_order_no, presence: true
end
