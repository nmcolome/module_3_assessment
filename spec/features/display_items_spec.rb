require 'rails_helper'

RSpec.describe "displays items" do
  it "reaches the root path" do
    visit "/"

    expect(page).to have_http_status(200)

    within("h1") do
      expect(page).to have_content("Items")
    end
  end
end