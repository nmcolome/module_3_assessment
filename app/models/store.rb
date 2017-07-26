class Store
  attr_reader :long_name, :city, :distance, :phone, :type

  def initialize(attrs)
    @attrs = attrs
    @long_name = attrs[:longName]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone = attrs[:phone]
    @type = attrs[:storeType]
  end

  def self.get_stores_near_me(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV['best_buy_api_key']}")
    response_json = JSON.parse(response.body, symbolize_names: true)
    stores = response_json[:stores].map do |store|
      new(store)
    end
    stores.unshift(response_json[:total])
  end

  private
    attr_reader :attrs
end