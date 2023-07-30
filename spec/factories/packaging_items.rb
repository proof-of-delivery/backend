FactoryBot.define do
  factory :packaging_item do
    packaging_detail factory: :packaging_detail
    pickup_item factory: :pickup_item
    quantity { Faker::Number.number(digits: 2) }
  end
end
