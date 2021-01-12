FactoryBot.define do
  factory :book do
    title       { "サンプル" }
    author      { "サンプル" }
    description { "サンプル" }
    genre_id    { 1 }
    association :user

    after(:build) do |book|
      book.book_image.attach(io: File.open("public/images/test_image.png"), filename: 'test_image.png')
    end
  end
end
