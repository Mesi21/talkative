class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  def last_three_posts
    posts.order(created_at: :DESC).limit(3)
  end
end