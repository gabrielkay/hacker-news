FactoryBot.define do
  factory :post do
    title { 'sampletitle' }
    link { 'https://example.com' }
    user
  end
end
