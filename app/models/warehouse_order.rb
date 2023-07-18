class WarehouseOrder < ApplicationRecord
  belongs_to :customer
  validates :doc_no, :purchase_order_no, presence: true
end
