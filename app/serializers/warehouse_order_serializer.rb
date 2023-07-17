class WarehouseOrderSerializer < ActiveModel::Serializer
  attributes :id, :doc_no, :date, :purchase_order_no, :name_of_ship, :delivery_date, :delivery_address
  has_many :items
  has_one :customer
end
