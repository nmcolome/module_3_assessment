require 'rails_helper'

RSpec.describe "BestBuyService" do
  context "class methods" do
    it ".get_stores_near_me" do
      stores = BestBuyService.get_stores_near_me("80202")
      store = stores.last

      expect(stores.shift).to eq(17)
      expect(store).to have_key("longName")
    end
  end
end