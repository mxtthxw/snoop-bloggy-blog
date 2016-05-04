class UsersController < ApplicationController
  def index
    @users = User.all.reverse
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).reverse
    @tags = Tag.all
  end

  def create
    @user = User.new(username: params[:user][:username], password: params[:user][:password], email: params[:user][:email], firstname: params[:user][:firstname], lastname: params[:user][:lastname], age: params[:user][:age])
    @comments_on = true
    @user.save
    redirect_to user_path(@user.id)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
  end

  def destroy
    # @user = User.find(params[:id])
    @user = User.find(79)
    @user.destroy
    redirect_to posts_path
  end
end
