class WarehouseItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :requested_quantity, :confirmed_quantity, :total_requested_quantity, :total_confirmed_quantity, :picked_up_quantity
  has_one :warehouse_order
  has_one :item
end
