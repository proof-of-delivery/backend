class ItemSerializer < ActiveModel::Serializer
  attributes :id, :position, :item_no, :description, :supplier_item_id, :quantity
end
