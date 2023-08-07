class PodHeaderSerializer < ActiveModel::Serializer
  attributes :id, :pickup_order_id, :pickedup_data, :pickedup_time, :customer_id, :freight_forwarder, :warehouse_order_id, :created_at, :updated_at

  belongs_to :pickup_order
  belongs_to :customer
  belongs_to :warehouse_order

  has_many :pod_items

end
