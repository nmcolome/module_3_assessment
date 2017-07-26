require 'rails_helper'

RSpec.describe "BestBuyService" do
  context "class methods" do
    it ".get_stores_near_me" do
      response = BestBuyService.get_stores_near_me("80202")

      expect(response).to be_a Hash
      expect(response).to have_key(:total)
      expect(response[:total]).to be_an Integer
      expect(response).to have_key(:stores)
      expect(response[:stores]).to be_an Array


      store = response[:stores].first

      expect(store).to have_key(:longName)
      expect(store).to have_key(:city)
      expect(store).to have_key(:distance)
      expect(store).to have_key(:phone)
      expect(store).to have_key(:storeType)
      expect(store[:longName]).to be_a String
      expect(store[:city]).to be_a String
      expect(store[:distance]).to be_a Float
      expect(store[:phone]).to be_a String
      expect(store[:storeType]).to be_a String
    end
  end
end