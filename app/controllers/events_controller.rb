class EventsController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  helper_method :sort_column,    :sort_direction
  before_action :set_event,      only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.search(params[:search]).paginate(page: params[:page], per_page: 25).order(sort_column + " " + sort_direction)
    @index = true
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @theme = Event.theme.theme
    @category = Event.category.category
    if @event.recurrence == 3
      @recurrence = "Weekly event"
    elsif @event.recurrence == 2
      @recurrence = "Monthly event"
    elsif @event.recurrence == 1
      @recurrence = "Annual event"
    else 
      @recurrence = "One time event"
    end
    if @event.stop == @event.start
      @date_range = @event.start.strftime("%B %d, %Y")
    else
      @date_range = "#{@event.start.strftime("%B %d
      ")} through #{@event.stop.strftime("%B %d, %Y")}"
    end
  end

  # GET /events/new
  def new
    @event = Event.new
    @themes = Theme.all
    @categories = Category.all
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @themes = Theme.all
    @categories = Category.all
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
        @event.attend!(current_user)
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # image/paperclip code borrowed from Kate & Jin
    def upload
      uploaded_io = params[:items][:image]
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    @item.image.destroy # remove image from s3
    @item.image.clear # queues attachment to be deleted
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
    flash[:success] = "Event deleted."
    redirect_to events_url
  end

  def attendees
    @title = "Attendees"
    @event = Event.find(params[:id])
    @attendees = @event.attending_users.paginate(page: params[:page])
    render 'show_attending'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :start, :stop, :location, :address, :recurrence, :user, :user_id, :contact, :theme_id, :category_id, :subcategoryA, :subcategoryB, :subcategoryC, :address2, :city, :state, :zipcode, :description, :tags, :image)
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to root_url if @event.nil?
    end

    def sort_column
      Event.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end