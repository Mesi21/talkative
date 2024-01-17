class PostsController < ApplicationController
  def index
    @user = User.find(params[:author_id])
    @posts = @user.last_three_posts
  end
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
end
