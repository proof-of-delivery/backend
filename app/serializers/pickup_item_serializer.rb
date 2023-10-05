# frozen_string_literal: true

class PickupItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  has_one :pickup_order
  has_one :item
  has_one :warehouse_item
end
