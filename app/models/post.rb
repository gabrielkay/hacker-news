class Post < ApplicationRecord
  validates :title, presence: true
  validates :user_id, presence: true
  validates_with UrlValidator
  belongs_to :user
  has_many :comments, as: :commentable
end
