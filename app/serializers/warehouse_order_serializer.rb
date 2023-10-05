# frozen_string_literal: true

class WarehouseOrderSerializer < ActiveModel::Serializer
  attributes :id, :doc_no, :name_of_ship, :delivery_date, :delivery_address
  has_one :customer
  has_many :warehouse_item
end
