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
    @post.destroy
    @item.image.destroy # remove image from s3
    @item.image.clear # queues attachment to be deleted
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.json { head :no_content }
    end
    flash[:success] = "Post deleted."
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
  
end
