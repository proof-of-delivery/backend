class Item < ApplicationRecord
    validates :position, :item_no, :description, :unit, presence: true
    validates :position, numericality: true
end
