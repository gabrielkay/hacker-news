class Vote < ApplicationRecord
  validates :user_id, presence: true
  belongs_to :user
  belongs_to :votable, polymorphic: true
  belongs_to :post
end
