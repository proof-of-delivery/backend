class PackagingDetail < ApplicationRecord
    has_many :packaging_item
    validates :package_type, :weight, :height, :length, :cbm, presence: true

    delegate :pickup_order_id, to: :packaging_items, prefix: false

    def self.ransackable_attributes(auth_object = nil)
        ['package_type', 'weight', 'height', 'length', 'width', 'cbm', 'id', 'created_at', 'updated_at']
    end
end
