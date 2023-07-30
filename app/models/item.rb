class Item < ApplicationRecord
    validates :position, :item_no, :description, :sales_order_no, :unit, presence: true
    validates :position, numericality: true

    def self.ransackable_attributes(auth_object = nil)
        ['position', 'item_no', 'description', 'sales_order_no', 'unit', 'id', 'created_at', 'updated_at']
    end
end
