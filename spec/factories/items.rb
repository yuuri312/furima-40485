FactoryBot.define do
  factory :item do
    name {"ジャケット"}
    description {"古着です"}
    category_id {2}
    condition_id {3}
    paid_shipping_cost_id {2}
    prefecture_id {3}
    due_date_id {3}
    price {987}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
