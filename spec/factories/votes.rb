FactoryBot.define do
  factory :up_vote, class: 'Vote' do
    user
    vote_type { 1 }

    factory :up_vote_comment do
      association :votable, factory: :comment
    end

    association :votable, factory: :post
  end

  factory :down_vote do
    user
    vote_type { -1 }

    factory :down_vote_comment do
      association :votable, factory: :comment
    end

    association :votable, factory: :post
  end
end
