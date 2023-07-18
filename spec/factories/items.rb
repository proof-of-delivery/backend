FactoryBot.define do
  factory :item do
    position { Faker::Number.number(digits: 2) }
    item_no { Faker::Number.number(digits: 2) }
    description { Faker::Lorem.sentences }
    supplier_item_id { Faker::Lorem.sentences }
    quantity { Faker::Number.number(digits: 2)}
  end
end
