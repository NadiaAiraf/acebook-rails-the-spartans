class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params[:message], user_id: current_user.id)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.reverse
  end

  def show
    puts params[:id]
    puts params
    @posts = Post.find(params[:id])
    @user = Post.find_post_user(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
