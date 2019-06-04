class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		fixed_link = url_extender(@post.link)
		redirect_to fixed_link
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

	private def url_extender(str)
		if !str[0,4].eql? "http"
			(str = "http://" + str)
		else
			str
		end
	end

end
