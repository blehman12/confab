class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]

  helper_method :sort_column, :sort_direction

  def index
    if params[:search]
      @users = User.search(params[:search]).paginate(page: params[:page], per_page: 25).order(sort_column + " " + sort_direction)
    else
      @users = User.paginate(page: params[:page], per_page: 25).order(sort_column + " " + sort_direction)
    end
  end

  def show
    @user = User.find(params[:id])
    @communications = @user.communications.paginate(page: params[:page], per_page: 10)
    @communication = current_user.communications.build if signed_in?
    @wants = @user.wants.paginate(page: params[:page], per_page: 10)
    @want = current_user.wants.build if signed_in?
    @skills = @user.skills.paginate(page: params[:page, per_page: 10])
    @skill = current_user.skills.build if signed_in?
    @events = @user.attended_events.paginate(page: params[:page], per_page: 10)
    @event = current_user.attended_events.build if signed_in?
    if @user == current_user
      @name_for_wants = "You Are"
      @name_none_posted = "You have"
      @name_possessive = "Your"
    else
      @name_for_wants = "#{@user.name.split[0]} Is"
      @name_none_posted = "#{@user.name.split[0]} has"
      @name_possessive = "#{@user.name.split[0]}'s"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Confab8!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page], per_page: 25)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 25)
    render 'show_follow'
  end

  def attendeds
    @user = User.find(params[:id])
    @name = "#{@user.name[0].upcase}#{@user.name[1..-1]}"
    if @user == current_user
      @title = "Events You Are Attending"
    else
      @title = "Events #{@name.split[0]} Is Attending"
    end
    # @event = Event.find(params[:id])
    @events = @user.attended_events.paginate(page: params[:page], per_page: 25)
    render 'show_attending'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless (current_user?(@user) || current_user.admin?)
    end

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
