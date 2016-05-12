class CommentsController < ApplicationController
  def create
  	current_user
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to post_path(@comment.post_id)
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	# @post_id = @comment.post_id
  	@comment.destroy
    # redirect_to post_path(@post_id)
  end

  private

  def comment_params
  	params.require(:comment).permit(:body, :user_id, :post_id)
  end

end
