class CommentsController < ApplicationController
  before_action :find_commentable, only: %i[show create]

  def show
    @comment = Comment.find(params[:id])
    @new_comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    #if @comment.save
    @comment.save
    @post = Post.find_by(id: comment_params[:parent_post_id])
    @comments = @post.comments
    @comment = Comment.new
    @vote = Vote.new
    render 'posts/show'
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id, :parent_post_id)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
  end
end
