class PostsController < ApplicationController
  
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def index
    @posts = Post.all.reverse
  end

  def show
    @post = Post.find(params[:id])
    # @user = User.where(id: @post.user_id)
    @user = @post.user
  end

  def create
    # current_user
    @user = User.find(77)
    # ^ temp hardcoding until login/sessions working
    @post = Post.new(title: params[:post][:title], body: params[:post][:body], post_tags_id: params[:post][:post_tags_id], user_id: @user.id)
    @comments_on = true
    @post.save
    redirect_to post_path(@post.id)
  end

  def new
    # current_user
    @user = User.find(77)
    @post = Post.new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
