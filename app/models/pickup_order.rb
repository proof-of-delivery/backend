class PickupOrder < ApplicationRecord
  belongs_to :customer

  validates :pickup_date, :pickup_time, :pickup_order_no, presence: true
end
