class PostsController < ApplicationController
  PAGE_SIZE = 5

  def index
    if params[:sort] == 'top'
      @posts = Post.all
      descending = -1
      @posts = @posts.sort_by do |post|
        post.post_points * descending
      end
    else
      @posts = Post.all.order(:created_at).reverse_order
    end
    @page = (params[:page] || 0).to_i
    @posts = @posts[(PAGE_SIZE * @page), (PAGE_SIZE)]

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

  private def post_params
    params.require(:post).permit(:title, :link)
  end
end
