class SearchController < ApplicationController
  def index
    binding.pry
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params[:search]},25))?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV['best_buy_api_key']}")
    response_json = JSON.parse(response.body, symbolize_names: true)
    total_stores = response_json[:total]
    @stores = response_json[:stores]
    [:longName]
    binding.pry
  end
end