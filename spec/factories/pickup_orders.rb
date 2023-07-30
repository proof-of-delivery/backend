FactoryBot.define do
  factory :pickup_order do
    customer factory: :customer
    pickup_date { Faker::Date.in_date_period }
    pickup_time { Faker::Lorem.sentences }
    pickup_order_no { Faker::Lorem.sentences }
    contact factory: :contact

  end
end
