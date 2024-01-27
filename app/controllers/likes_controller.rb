class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(
      user_id: current_user.id,
      post_id: @post.id
    )
    @like.update_likes_counter
    if @like.save
      redirect_to posts_path, notice: 'Like added successfully!'
    else
      redirect_to posts_path, alert: 'Something went wrong!'
    end
  end
end
