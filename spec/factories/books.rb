FactoryBot.define do
  factory :book do
    title            { Faker::Book.title }
    category_id { Faker::Number.between(from: 1, to: 9) }
    genre_id    { Faker::Number.between(from: 1, to: 24) }
    catch_copy       { Faker::Lorem.sentence }
    content          { Faker::Lorem.sentence }
    highlight        { Faker::Lorem.sentence }
    association :user

    after(:build) do |book|
      book.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
