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
    response = BestBuyService.get_stores_near_me(zip)[:stores]
    stores = response.map do |store|
      new(store)
    end
  end

  private
    attr_reader :attrs
end