FactoryBot.define do
  factory :user do
    email { 'example11@example.com' }
    password { 'password' }
    # using dynamic attributes over static attributes in FactoryBot

    # if needed
    # is_active true
  end
end
