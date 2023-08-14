class PodHeader < ApplicationRecord
  belongs_to :pickup_order
  has_many :pod_items

  delegate :customer_id, :contact_id, :pickup_date, :pickup_time, to: :pickup_order, prefix: false

end
