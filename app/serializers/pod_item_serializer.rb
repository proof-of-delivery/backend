class PodItemSerializer < ActiveModel::Serializer
  attributes :id, :vessel, :packaging_detail_item_id, :customs_document, :pod_header_id, :created_at, :updated_at

  belongs_to :pod_header
end
