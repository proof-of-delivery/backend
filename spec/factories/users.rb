FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    user_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    password_digest { Faker::Internet.password }
  end
end
