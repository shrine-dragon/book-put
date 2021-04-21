FactoryBot.define do
  factory :questionnaire do
    category_id  { Faker::Number.between(from: 1, to: 9) }
    genre_id     { Faker::Number.between(from: 1, to: 24) }
    purchase_place_id { Faker::Number.between(from: 1, to: 3) }
    reading_media_id  { Faker::Number.between(from: 1, to: 3) }
  end
end
