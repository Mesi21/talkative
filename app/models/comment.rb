class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  belongs_to :post
  after_save :update_comments_counter

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
