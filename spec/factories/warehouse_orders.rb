FactoryBot.define do
  factory :warehouse_order do
    customer_address { FFaker::Lorem.sentences }
    doc_no { FFaker::Lorem.sentences }
    date { FFaker::Lorem.sentences }
    customer_id { FFaker::Lorem.sentences }
    assistance { FFaker::Lorem.sentences }
    email { FFaker::Lorem.sentences }
    purchase_order_no { FFaker::Lorem.sentences }
    name_of_ship { FFaker::Lorem.sentences }
    delivery_date { FFaker::Lorem.sentences }
    delivery_address { FFaker::Lorem.sentences }
    voyage_no { FFaker::Lorem.sentences }
    weight_package { FFaker::Lorem.sentences }
    item factory: :item
  end
end
