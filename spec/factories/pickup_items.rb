# frozen_string_literal: true

FactoryBot.define do
  factory :pickup_item do
    pickup_order factory: :pickup_order
    item factory: :item
    warehouse_item factory: :warehouse_item
    quantity { Faker::Number.number(digits: 2) }
  end
end
