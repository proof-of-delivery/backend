# frozen_string_literal: true

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :position, :item_no, :description, :sales_order_no, :unit
end
