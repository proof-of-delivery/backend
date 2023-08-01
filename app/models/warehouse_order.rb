class WarehouseOrder < ApplicationRecord
  belongs_to :customer
  validates :doc_no, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ['doc_no', 'name_of_ship', 'delivery_address','delivery_date', 'customer_id','created_at', 'updated_at']
  end
end
