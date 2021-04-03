FactoryBot.define do
  factory :questionnaire do
    book_category_id  { Faker::Number.between(from: 1, to: 9) }
    book_genre_id     { Faker::Number.between(from: 1, to: 24) }
    purchase_place_id { Faker::Number.between(from: 1, to: 3) }
    reading_type_id   { Faker::Number.between(from: 1, to: 3) }
  end
end
