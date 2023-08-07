FactoryBot.define do
  factory :pod_item do
    vessel { Faker::Vehicle.manufacture }
    packaging_detail_item_id { Faker::Number.number(digits: 2) }
    customs_document { Faker::IDNumber.valid }
    pod_header factory: :pod_header 
  end
end
