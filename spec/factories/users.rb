FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.unique.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {"山田"}
    last_name {"一郎"}
    first_name_kana {"ヤマダ"}
    last_name_kana {"イチロウ"}
    birth_day {"1995-05-05"}
  end
end