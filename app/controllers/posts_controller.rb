class PostsController < ApplicationController
	def new
		@post = Post.new
		
	end

	def show
		@post = Post.find(params[:id])
		@comment = @post.comments.build
		@comments = @post.comments.all
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to current_user
		else
			render "static_pages/home"
		end

	end

	private

		def post_params
			params.require(:post).permit(:title,:content)
		end
end
