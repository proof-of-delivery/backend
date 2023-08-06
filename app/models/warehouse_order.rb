class WarehouseOrder < ApplicationRecord
  belongs_to :customer
  has_many :warehouse_item
  validates :doc_no, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ['doc_no', 'name_of_ship', 'delivery_date', 'delivery_address', 'customer_id', 'id', 'created_at', 'updated_at']
  end
end
