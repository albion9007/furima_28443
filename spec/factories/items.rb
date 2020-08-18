FactoryBot.define do
  factory :item do

    item_name { "MacBook" }
    item_explain { "MacBookPro 2020 13.5インチ" }
    category_id  { 2 }
    quality_id { 4 }
    deliveryfee_id { 3 }
    shipplace_id { 6 }
    shipday_id { 2 }
    price { 120000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'test.jpeg')), filename: 'test.jpeg')
    end
  end
end
