class CommentsController < ApplicationController
before_action :find_commentable

  def show
    @comment = Comment.find(params[:id])
    @new_comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      if params[:comment_id]
        redirect_to root_path
      else
        redirect_to post_path(@commentable)
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :commentable_type, :commentable_id)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end
end
