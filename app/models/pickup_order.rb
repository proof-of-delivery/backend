class PickupOrder < ApplicationRecord
  belongs_to :customer
  belongs_to :contact
  has_many :pickup_items

  validates :pickup_date, :pickup_time, :pickup_order_no, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ['customer_id', 'pickup_date', 'pickup_time', 'pickup_order_no', 'contact_id', 'id', 'created_at', 'updated_at']
  end

end
