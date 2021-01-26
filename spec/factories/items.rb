FactoryBot.define do
  factory :item do
    name {"test"}
    description {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    charge_id {2}
    prefecture_id {2}
    ship_id {2}
    price {"1000"}


    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
