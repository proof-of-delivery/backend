class PickupOrderSerializer < ActiveModel::Serializer
  attributes :id, :pickup_date, :pickup_time, :pickup_order_no
  has_one :customer
end
