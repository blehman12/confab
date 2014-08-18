class CommunicationsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def create
    @communication = current_user.communications.build(communication_params)
    if @communication.save
      flash[:success] = "Communication Preference Added!"
      redirect_to root_url
    else
      render root_url
    end
  end

  def destroy
  end

  private

    def communication_params
      params.require(:communication).permit(:excomm, :userinfo)
    end
end