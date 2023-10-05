# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    address { Faker::Lorem.sentences }
    primary_contact factory: :contact
    billing_contact factory: :contact
  end
end
