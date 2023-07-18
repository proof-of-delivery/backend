class PickupOrder < ApplicationRecord
  belongs_to :customer

  validates :pickup_date, :pickup_time, presence: true
end
