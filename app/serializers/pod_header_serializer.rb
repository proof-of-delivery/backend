class PodHeaderSerializer < ActiveModel::Serializer
  attributes :id, :pickup_order_id, :contact_id, :customer_id, :pickup_date, :pickup_time
  belongs_to :pickup_order

  has_many :pod_items

end
