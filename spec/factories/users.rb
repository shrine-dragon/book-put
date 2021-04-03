FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    gender_id             { Faker::Number.between(from: 1, to: 4) }
    birth_day             { Faker::Date.backward }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 12) }
    password_confirmation { password }
  end

  after(:build) do |item|
    item.image.attach(io: File.open('app/assets/images/no-image.png'), filename: 'no-image.png')
  end
end
