FactoryBot.define do
  factory :item do
    position { FFaker::Number.number }
    item_no { FFaker::Number.number }
    description { FFaker::Lorem.sentences }
    supplier_item_id { FFaker::Lorem.sentences }
    quantity { FFaker::Number.number }
  end
end
