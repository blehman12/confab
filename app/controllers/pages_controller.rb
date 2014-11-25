class PagesController < ApplicationController
  def home
    # show's some of signed-in user's stats
    if signed_in?
      @want = current_user.wants.build
      @wantlist_items = current_user.wantlist.paginate(page: params[:page], per_page: 10)
      @skill = current_user.skills.build
      @skilllist_items = current_user.skilllist.paginate(page: params[:page], per_page: 10)
      @events = current_user.attended_events.paginate(page: params[:page], per_page: 5)
      @event = current_user.attended_events.build if signed_in?
      @events.each do |event|
      if event.stop == event.start
        @date_range = event.start.strftime("%b %d, %Y")
      else
        @date_range = "#{event.start.strftime("%b %d
        ")} – #{event.stop.strftime("%b %d, %Y")}"
      end
    end
    end
  end

  def help
  end
end
