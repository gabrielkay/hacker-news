class CommentsController < ApplicationController
  # # GET /comments
  # # GET /comments.json
  # def index
  #   @comments = Comment.all
  # end

  # # GET /comments/1
  # # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])
    @new_comment = Comment.new
  end

  # # GET /comments/new
  # def new
  #   @comment = Comment.new
  # end

  # # GET /comments/1/edit
  # def edit
  # end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      render 'new'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id, :comment_id)
    end
end
