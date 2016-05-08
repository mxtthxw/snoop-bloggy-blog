class PostsController < ApplicationController
  
  # def current_user
  #   if session[:user_id]
  #     @current_user = User.find(session[:user_id])
  #   end
  # end

  def index
    @posts = Post.all.reverse
  end

  def show
    current_user
    @post = Post.find(params[:id])
    # @user = User.where(id: @post.user_id)
    @user = @post.user
    @comments = Comment.where(post_id: params[:id])
    @comment = Comment.new
  end

  def create
    current_user
    # @user = User.find(77)
    # ^ temp hardcoding until login/sessions working
    @post = Post.new(post_params)
      # title: params[:post][:title], body: params[:post][:body], post_tags_id: params[:post][:post_tags_id], user_id: @user.id
    @post.comments_on = true
    @post.save
    redirect_to post_path(@post)
  end

  def new
    current_user
    @post = Post.new
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_tags_id, :user_id, :comments_on)
  end

end
