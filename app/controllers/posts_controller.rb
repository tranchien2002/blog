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
		@post = current_user.posts.new(post_params)
		if @post.save
			# byebug
			# render json: {
			# 	post_data: render_to_string(@post)
			# }
		redirect_to root_url
		else
			render "static_pages/home"
		end

	end

	private

		def post_params
			params.require(:post).permit(:title,:content)
		end
end
