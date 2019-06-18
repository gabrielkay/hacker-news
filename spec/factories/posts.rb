FactoryBot.define do
  factory :post do
    title { "sampletitle" }
    link { "https://example.com" }
    user_id { 1 }
  end
end
