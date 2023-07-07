FactoryBot.define do
  factory :warehouse_order do
    customer_address { Faker::Lorem.sentences }
    doc_no { Faker::Lorem.sentences }
    date { Faker::Lorem.sentences }
    customer_id { Faker::Lorem.sentences }
    assistance { Faker::Lorem.sentences }
    email { Faker::Lorem.sentences }
    purchase_order_no { Faker::Lorem.sentences }
    name_of_ship { Faker::Lorem.sentences }
    delivery_date { Faker::Lorem.sentences }
    delivery_address { Faker::Lorem.sentences }
    voyage_no { Faker::Lorem.sentences }
    weight_package { Faker::Lorem.sentences }
  end
end
