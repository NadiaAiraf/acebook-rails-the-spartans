class UsersController < ApplicationController
  def show
    puts params[:id]
    @user = User.find(params[:id])
    @friends = @user.followers(User)
  end

  def addfriend
    @user = User.find(params[:id])
    current_user.follow!(@user)
    redirect_to posts_url
  end
end
