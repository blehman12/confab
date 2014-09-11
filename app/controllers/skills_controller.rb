class SkillsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :index]
  before_action :correct_user,   only: :destroy

  def index
    if params[:search]
      @skills = Skill.search(params[:search]).paginate(page: params[:page], per_page: 30)
    else
      @skills = Skill.paginate(page: params[:page], per_page: 30)
    end
    @index = true
  end

  def create
    @skill = current_user.skills.build(skill_params)
    if @skill.save
      flash[:success] = "Specialty Added!"
      redirect_to user_path(current_user.id)
    else
      render user_path(current_user.id)
    end
  end

 def destroy
    @skill.destroy
    redirect_to user_path(current_user.id)
  end

  private

    def skill_params
      params.require(:skill).permit(:skill, :level, :tag, :category)
    end

    def correct_user
      @skill = current_user.skills.find_by(id: params[:id])
      redirect_to root_url if @skill.nil?
    end
end
