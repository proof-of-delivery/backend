class PackagingItem < ApplicationRecord
  belongs_to :packaging_detail
  belongs_to :pickup_item

  validates :quantity, presence: true
end
