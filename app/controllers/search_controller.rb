class SearchController < ApplicationController
  def index
    @posts = Search.for(params[:q])
  end
end
