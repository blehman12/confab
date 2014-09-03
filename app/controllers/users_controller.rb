class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @communications = @user.communications.paginate(page: params[:page])
    @communication = current_user.communications.build if signed_in?
    @wants = @user.wants.paginate(page: params[:page])
    @want = current_user.wants.build if signed_in?
    @skills = @user.skills.paginate(page: params[:page])
    @skill = current_user.skills.build if signed_in?
    if @user == current_user
      @name_for_wants = "You Are"
      @name_none_posted = "You have"
    else
      @name_for_wants = "#{@user.name} Is"
      @name_none_posted = "#{@user.name} has"
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

  def search
    q = params[:user][:name]
    @users = User.find(:all, :conditions => ["name LIKE %?%",q])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
