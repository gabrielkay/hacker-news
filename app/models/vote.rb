class Vote < ApplicationRecord
  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: %i[votable_type votable_id] }
  belongs_to :user
  belongs_to :votable, polymorphic: true
end
