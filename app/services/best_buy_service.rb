class BestBuyService
  attr_reader :zip, :conn

  def initialize(zip)
    @zip = zip
    @conn = Faraday.new("https://api.bestbuy.com/")
  end

  def get_stores_near_me
    response = conn.get("v1/stores(area(#{zip},25))?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV['best_buy_api_key']}")
    response_json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_stores_near_me(zip)
    new(zip).get_stores_near_me
  end
end