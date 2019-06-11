FactoryBot.define do
  factory :post do
    title { "sampletitle" }
    link { "https://example.com" }
  end

  factory :user do
    email { "example@example.com" }
  end

end
