class SkillsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def create
    @skill = current_user.skills.build(skill_params)
    if @skill.save
      flash[:success] = "Specialty Added!"
      redirect_to root_url
    else
      render root_url
    end
  end

 def destroy
    @skill.destroy
    redirect_to root_url
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
