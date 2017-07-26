class SearchController < ApplicationController
  def index
    # @stores = Store.get_stores_near_me(params[:search])
    @stores = Kaminari.paginate_array(Store.get_stores_near_me(params[:search])).page(params[:page]).per(10)
  end
end