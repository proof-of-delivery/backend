class WarehouseOrder < ApplicationRecord
  belongs_to :customer
  validates :doc_no, presence: true
end
