class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post added!"
      redirect_to user_path(current_user)
    else
      render user_path(current_user)
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
  
end
