FactoryBot.define do
  factory :pod_item do
    vessel { Faker::Vehicle.manufacture }
    packaging_item factory: :packaging_item
    customs_document { Faker::IDNumber.valid }
    pod_header factory: :pod_header 
  end
end
