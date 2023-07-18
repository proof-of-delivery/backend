class PickupItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  has_one :pickup_order
  has_one :item
  has_one :warehouse_order
end
