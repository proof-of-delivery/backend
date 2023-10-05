# frozen_string_literal: true

class PackagingItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  has_one :packaging_detail
  has_one :pickup_item
end
