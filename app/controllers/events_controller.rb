class EventsController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  # before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  helper_method :sort_column, :sort_direction

  def index
    if params[:search]
      @events = Event.search(params[:search]).paginate(page: params[:page], per_page: 30).order(sort_column + " " + sort_direction)
    else
      @events = Event.paginate(page: params[:page], per_page: 30).order(sort_column + " " + sort_direction)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @event.owner = current_user
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Your has been created!"
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
      @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted."
    redirect_to users_url
  end

  private
    def event_params
      params.require(:event).permit(:name, :start, :stop, :contact, :address, :theme, :recurrence)
    end


    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
    #   @event = current_user.events.find_by(id: params[:id])
    #   redirect_to root_url if @event.nil?
    # end

    def sort_column
      Event.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  end
end
