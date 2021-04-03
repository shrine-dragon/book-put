FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name(max_length: 12) }
    gender_id             { Faker::Number.between(from: 1, to: 4) }
    birth_day             { Faker::Date.backward }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker.password(min_length: 12, max_length: 20) }
    password_confirmation { password }
  end
end
