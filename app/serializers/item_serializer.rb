class ItemSerializer < ActiveModel::Serializer
  attributes :id, :position, :item_no, :description, :supplier_item_id, :quantity
  has_one :warehouse_order
end
