class PackagingItem < ApplicationRecord
  belongs_to :packaging_detail
  belongs_to :pickup_item

  validates :quantity, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ['pickup_item_id', 'packaging_detail_id', 'quantity', 'id', 'created_at', 'updated_at']
  end

end
