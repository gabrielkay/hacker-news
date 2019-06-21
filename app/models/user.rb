class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :votes
  has_many :voted_on_posts, through: :votes, source: :votable, source_type: 'Post'
  has_many :voted_on_comments, through: :votes, source: :votable, source_type: 'Comment'

  def karma
    user_karma = 0
    posts.each do |p|
      user_karma += p.votes.sum('vote_type')
    end
    comments.each do |c|
      user_karma += c.votes.sum('vote_type')
    end
    user_karma
  end
end
