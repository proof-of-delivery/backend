class WarehouseItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :total_requested_quantity, :total_confirmed_quantity, :picked_up_quantity, :status
  has_one :warehouse_order
  has_one :item
end
