class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :body, presence: true
  belongs_to :user

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
