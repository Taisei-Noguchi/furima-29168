FactoryBot.define do
  factory :street_address do
    postal_code    {"123-4567"}
    shipping_area  {"11"}
    city           {"大阪市"}
    address_detail {"123"}
    phone_number   {"12312341234"}
    token          {"123"}
  end
end
