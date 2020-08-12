FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password  { "abc123" }
    password_confirmation { password }
    first_name { "石倉" }
    last_name { "操" }
    first_name_kana { "イシクラ" }
    last_name_kana { "ミサオ" }
    birth_date {Faker::Date.birthday(min_age: 2020-12-13)}
  end
end