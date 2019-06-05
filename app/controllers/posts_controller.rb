class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		redirect_to Post.find(params[:id]).link
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
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
