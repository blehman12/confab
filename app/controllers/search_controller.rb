class SearchController < ApplicationController
  def search
    @result = SearchResult.where("content like ?", "%#{params[:q]}%")
    if params[:user]
      @result = @result.where(user: params[:user])
    end
  end

  # def users
  #   search do
  #     User.where :name => params[:q]
  #   end
  # end

  # def wants
  #   search do
  #     Want.where :wanted => params[:q]
  #   end
  # end

  # def skills
  #   search do
  #     Skill.where :skill => params[:q]
  #   end
  # end

  # private

  # def search(&block)    
  #   if params[:q]
  #     @results = yield if block_given?

  #     respond_to do |format|
  #       format.html # resources.html.erb
  #       format.json { render json: @results }
  #     end
  #   else
  #     redirect_to root_url, :notice => 'No search query was specified.'
  #   end
  # end

end
