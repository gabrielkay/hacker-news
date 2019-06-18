class Post < ApplicationRecord
  validates :title, presence: true
  validates :user_id, presence: true
  validates_with UrlValidator
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :voters, through: :votes, source: :votable, source_type: "User"
end
