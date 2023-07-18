class WarehouseOrderSerializer < ActiveModel::Serializer
  attributes :id, :doc_no, :purchase_order_no, :name_of_ship, :delivery_date, :delivery_address
  has_one :customer
end
