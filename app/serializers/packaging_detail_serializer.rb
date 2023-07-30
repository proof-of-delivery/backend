class PackagingDetailSerializer < ActiveModel::Serializer
  attributes :id, :package_type, :weight, :length, :width, :height, :cbm
end
