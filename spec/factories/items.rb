FactoryBot.define do
  factory :item do
    position { Faker::Number.number(digits: 2) }
    item_no { Faker::Lorem.sentences }
    description { Faker::Lorem.sentences }
    unit { Faker::Lorem.sentences }
  end
end
