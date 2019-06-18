FactoryBot.define do
  factory :vote do
    user_id { 1 }
    votable_id { 1 }
    votable_type { "MyString" }
    vote_type { 1 }
  end
end
