class PackagingDetailSerializer < ActiveModel::Serializer
  attributes :id, :package_type, :weight, :length, :width, :height, :cbm, :pickup_order_id
  has_many :packaging_item
end
