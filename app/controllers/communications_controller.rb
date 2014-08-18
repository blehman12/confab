class CommunicationsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def create
    @communication = current_user.communications.build(communication_params)
    if @communication.save
      flash[:success] = "Communication Preference Added!"
      redirect_to user_path(current_user.id)
    else
      render user_path(current_user.id)
    end
  end

  def destroy
    @communication.destroy
    redirect_to user_path(current_user.id)
  end

  private

    def communication_params
      params.require(:communication).permit(:excomm, :userinfo)
    end
end