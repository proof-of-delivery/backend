class PackagingItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :pickup_order_id
  has_one :packaging_detail
  has_one :pickup_item
end
