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
    response = BestBuyService.get_stores_near_me(zip)
    stores = response[:stores].map do |store|
      new(store)
    end
    stores.unshift(response[:total])
  end

  private
    attr_reader :attrs
end