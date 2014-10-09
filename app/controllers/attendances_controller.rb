class AttendancesController < ApplicationController
  before_action :signed_in_user

  def create
    @event = Event.find(params[:attendance][:attended_id])
    current_user.attend!(@event)
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

  def destroy
    @event = Attendance.find(params[:id]).attended
    current_user.unattend!(@event)
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end
end
