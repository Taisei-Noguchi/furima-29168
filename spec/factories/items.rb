FactoryBot.define do
  factory :item do
    name             {"東京"}
    detail           {"東京です。"}
    price            {"5000"}
    category_id      {"9"}
    condition_id     {"2"}
    delivery_fee_id  {"3"}
    shipping_area_id {"9"}
    shipping_days_id {"2"}
    association :user

    # after(:build) do |item|
    #   item.image.attach(io: File.open('public/output-image2.png'), filename: 'output-image2.png')
    # end
  end
end
