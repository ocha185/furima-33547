FactoryBot.define do
  factory :item do
    name {"test"}
    description {Faker::Lorem.sentence}
    category {2}
    condition {2}
    charges {2}
    prefecture {2}
    ship {2}
    price {"1000"}


    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
