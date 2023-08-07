class PodHeader < ApplicationRecord
  belongs_to :pickup_order
  belongs_to :customer
  belongs_to :warehouse_order
  has_many :pod_items
end
