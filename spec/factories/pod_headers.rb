# frozen_string_literal: true

FactoryBot.define do
  factory :pod_header do
    pickup_order factory: :pickup_order
    pickedup_data { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short) }
    pickedup_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    customer factory: :customer
    freight_forwarder { Faker::Company.name }
    warehouse_order factory: :warehouse_order
  end
end
