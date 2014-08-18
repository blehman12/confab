class PagesController < ApplicationController
  def home
    if signed_in?
      @communication  = current_user.communications.build
      @commlist_items = current_user.commlist.paginate(page: params[:page])
      @want = current_user.wants.build
      @wantlist_items = current_user.wantlist.paginate(page: params[:page])
      @skill = current_user.skills.build
      @skilllist_items = current_user.skilllist.paginate(page: params[:page])
    end
  end

  def help
  end
end
