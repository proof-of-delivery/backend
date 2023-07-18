class PickupOrderSerializer < ActiveModel::Serializer
  attributes :id, :pickup_date, :pickup_time
  has_one :customer
end
