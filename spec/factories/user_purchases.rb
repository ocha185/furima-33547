FactoryBot.define do
  factory :user_purchase do
    post_code { '345-8890' }
    prefecture_id { 4 }
    city { '函館' }
    address { '青山4-8' }
    building_name { '' }
    phone_number { '09023457689' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
