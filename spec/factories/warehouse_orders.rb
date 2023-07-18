FactoryBot.define do
  factory :warehouse_order do
    doc_no { Faker::Lorem.sentences }
    purchase_order_no { Faker::Lorem.sentences }
    name_of_ship { Faker::Lorem.sentences }
    delivery_date { Faker::Date.in_date_period }
    delivery_address { Faker::Lorem.sentences }
    customer factory: :customer
  end
end
