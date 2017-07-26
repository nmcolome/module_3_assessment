class SearchController < ApplicationController
  def index
    @stores = Store.get_stores_near_me(params[:search])
  end
end