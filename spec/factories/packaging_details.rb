# frozen_string_literal: true

FactoryBot.define do
  factory :packaging_detail do
    package_type { %w[box pallet].sample }
    weight { Faker::Number.number(digits: 2) }
    length { Faker::Number.number(digits: 2) }
    width { Faker::Number.number(digits: 2) }
    height { Faker::Number.number(digits: 2) }
    cbm { Faker::Number.number(digits: 2) }
  end
end
