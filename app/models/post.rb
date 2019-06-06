class Post < ApplicationRecord
  validates :title, presence: true
  validates_with UrlValidator
end
