# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Name.name }
    phone_number { Faker::Name.name }
  end
end
