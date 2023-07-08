class WarehouseOrderSerializer < ActiveModel::Serializer
  attributes :id, :customer_address, :doc_no, :date, :customer_id, :assistance, :email, :purchase_order_no, :name_of_ship, :delivery_date, :delivery_address, :voyage_no, :weight_package
  has_one :item
end
