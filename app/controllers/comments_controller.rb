class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
    @new_comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id, :comment_id)
    end
end
