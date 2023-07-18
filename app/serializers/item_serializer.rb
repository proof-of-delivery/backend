class ItemSerializer < ActiveModel::Serializer
  attributes :id, :position, :item_no, :description, :unit
end
