class PostsController < ApplicationController

  helper_method :top

  PAGE_SIZE = 5

  def index
    @page = (params[:page] || 0).to_i
    @posts = Post.offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
    @vote = Vote.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
    @vote = Vote.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def top
    @posts = Post.all
    #@posts = Post.order(post_points)
  end

  private def post_params
    params.require(:post).permit(:title, :link)
  end
end
