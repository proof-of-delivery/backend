class PackagingItem < ApplicationRecord
  belongs_to :packaging_detail
  belongs_to :pickup_item

  validates :quantity, presence: true

  # delegate(:pickup_order_id, to: :pickup_item, prefix: false)

  # def delivery_address
  #   pickup_item.warehouse_item.confirmed_quantity
  # end

  def self.ransackable_attributes(auth_object = nil)
    ['pickup_item_id', 'packaging_detail_id', 'quantity', 'id', 'created_at', 'updated_at']
  end

end
