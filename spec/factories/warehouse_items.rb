FactoryBot.define do
  factory :warehouse_item do
    warehouse_order factory: :warehouse_order
    item factory: :item
    quantity { Faker::Number.number(digits: 2) }
    requested_quantity { Faker::Number.number(digits: 2) }
    confirmed_quantity { Faker::Number.number(digits: 2) }
    total_requested_quantity { Faker::Number.number(digits: 2) }
    total_confirmed_quantity { Faker::Number.number(digits: 2) }
    picked_up_quantity { Faker::Number.number(digits: 2) }
  end
end
