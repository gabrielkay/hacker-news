FactoryBot.define do
  # comment builds a comment on a post, comment_comment builds a comment on a comment
  factory :comment do
    user
    body { "samplecomment" }
    association :commentable, factory: :post
  end

  factory :comment_comment, class: "Comment" do
    user
    body { "samplereply" }
    association :commentable, factory: :comment
  end
end
