class Item < ApplicationRecord
    belongs_to :warehouse_order

    validates :position, :item_no, :description, :supplier_item_id, :quantity, presence: true
    validates :position, :item_no, :quantity, numericality: true


end
