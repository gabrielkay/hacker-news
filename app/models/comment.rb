class Comment < ApplicationRecord
  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :body, presence: true
  belongs_to :post
  belongs_to :user
end
