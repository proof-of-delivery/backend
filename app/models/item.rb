class Item < ApplicationRecord
    validates :position, :item_no, :description, :sales_order_no, :unit, presence: true
    validates :position, numericality: true
end
