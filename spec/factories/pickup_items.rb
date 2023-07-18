FactoryBot.define do
  factory :pickup_item do
    pickup_order factory: :pickup_order
    item factory: :item
    warehouse_order factory: :warehouse_order
    quantity { Faker::Number.number(digits: 2) }
  end
end
