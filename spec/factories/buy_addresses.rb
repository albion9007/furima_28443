FactoryBot.define do
  factory :buy_address do
    post_num { '123-4567' }
    prefecture_id { 3 }
    city { '吹田市' }
    house_num { '1-1' }
    apart_name { '東京ハイツ' }
    tel { 11111111111 }
    token  { 123456798 }
  end
end
