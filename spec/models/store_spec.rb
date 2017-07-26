require 'rails_helper'

RSpec.describe "Store" do
  it "returns a valid store" do
    raw_store = {
      :longName=>"BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER",
      :city=>"Denver",
      :distance=>3.45,
      :phone=>"303-270-9189",
      :storeType=>"Mobile SAS"
    }

    store = Store.new(raw_store)

    expect(store.long_name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
    expect(store.city).to eq("Denver")
    expect(store.distance).to eq(3.45)
    expect(store.phone).to eq("303-270-9189")
    expect(store.type).to eq("Mobile SAS")
  end
end