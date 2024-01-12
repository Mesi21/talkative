class User < ApplicationRecord
  validates :name, presence: true, length: { in: 4..25 }
  validates :posts_counter, comparision: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  def last_three_posts
    posts.order(created_at: :DESC).limit(3)
  end
end
