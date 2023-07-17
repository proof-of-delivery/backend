FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    address { Faker::Lorem.sentences }
    primary_contact { Faker::Lorem.sentences }
    billing_contact { Faker::Lorem.sentences }
  end
end
