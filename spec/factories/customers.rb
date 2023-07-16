FactoryBot.define do
  factory :customer do
    name { Faker::Company.name }
    address { Faker::Address.full_address  }
    primary_contact { Faker::PhoneNumber.phone_number }
    billing_contact { Faker::PhoneNumber.phone_number }
  end
end
