class AttendancesController < ApplicationController
  before_action :signed_in_user

  def create
    @user = User.find(params[:attendance][:attended_id])
  #     current_user.attend!(@user)
  #     respond_to do |format|
  #       format.html { redirect_to @user }
  #       format.js
  #     end
  #   end

  #   def destroy
  #     @user = Relationship.find(params[:id]).followed
  #     current_user.unfollow!(@user)
  #     respond_to do |format|
  #       format.html { redirect_to @user }
  #       format.js
  #     end
  #   end

end
