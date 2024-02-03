class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { in: 4..25 }
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  def last_three_posts
    posts.order(created_at: :DESC).limit(3)
  end
end
