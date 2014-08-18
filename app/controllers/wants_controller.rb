class WantsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @want = current_user.wants.build(want_params)
    if @want.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path(current_user.id)
    else
      render user_path(current_user.id)
    end
  end

  def destroy
    @want.destroy
    redirect_to user_path(current_user.id)
  end

  private

    def want_params
      params.require(:want).permit(:wanted, :priority, :tag, :category)
    end

    def correct_user
      @want = current_user.wants.find_by(id: params[:id])
      redirect_to user_path if @want.nil?
    end
end
