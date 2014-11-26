class WantsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :index]
  before_action :correct_user,   only: :destroy
  helper_method :sort_column, :sort_direction

  def index
    if params[:search]
      @wants = Want.search(params[:search]).paginate(page: params[:page], per_page: 30).order(sort_column + " " + sort_direction)
    else
      @wants = Want.paginate(page: params[:page], per_page: 30).order(sort_column + " " + sort_direction)
    end
    @index = true
  end

  def create
    @want = current_user.wants.build(want_params)
    @themes = Theme.all
    @categories = Category.all
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

    def sort_column
      Want.column_names.include?(params[:sort]) ? params[:sort] : "wanted"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
