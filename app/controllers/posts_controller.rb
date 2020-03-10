class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new
	  @post.title = params[:title]
	  @post.description = params[:description]
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	#   @post.update(title: params[:title], description: params[:description])

	#we needed to change our update method, because our params look different, now that we're using form_for
	@post.update(params.require(:post).permit(:title, :description))
	  redirect_to post_path(@post)
	end
end