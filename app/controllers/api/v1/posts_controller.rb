class Api::V1::PostsController < ActionController::Base
	 protect_from_forgery with: :null_session

	def index
    @posts = Post.all

    if @posts.present?
      render status: :ok, json: { posts: @posts }
    else
      render status: :not_found, json: { message: 'No Posts found' }
    end
	end
	 def create
    @post = Post.new(post_params)

    if @post.save
      render status: :ok, json: { message: 'Successfully created the Post' }
    else
      render status: :bad_request, json: { message: 'Invalid Post' }
    end
  end

  def update
    @post = Post.find_by_id(params[:id])

    if @post
      if @post.update_attributes(post_params)
        render status: :ok, json: { message: 'Successfully Updated the Post' }
      else
      	render status: :bad_request, json: { message: @post.errors.full_messages }
      end
    else
      render status: :not_found, json: { message: "No post Found" }
    end
  end
  def destroy
    @post = Post.find_by_id(params[:id])

    if @post && @post.destroy
      render status: :ok, json: { message: "Successfully deleted the Post"}
    else
      render status: :not_found, json: { message: "No post Found"}
    end
  end


  def post_params
    params.require(:post).permit(:title, :text, :image, :user_id)
  end
end
