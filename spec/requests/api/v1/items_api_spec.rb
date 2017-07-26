require 'rails_helper'

RSpec.describe "Items API" do
  context "GET /api/v1/items" do
    it "returns a list of items" do
      item1 = Item.create!(name: "item1" , description: "description1" , image_url: "image_url1")
      item2 = Item.create!(name: "item2" , description: "description2" , image_url: "image_url2")
      item3 = Item.create!(name: "item3" , description: "description3" , image_url: "image_url3")

      get "/api/v1/items"

      expect(response).to be_success

      items = JSON.parse(response.body)
      item = items.first

      expect(items.count).to eq(3)
      expect(item["id"]).to eq(item1.id)
      expect(item["name"]).to eq("item1")
      expect(item["description"]).to eq("description1")
      expect(item["image_url"]).to eq("image_url1")
      expect(item["created_at"]).to be_nil
      expect(item["updated_at"]).to be_nil
    end
  end

  context "GET /api/v1/items/:id" do
    it "returns a specific item" do
      item1 = Item.create!(name: "item1" , description: "description1" , image_url: "image_url1")

      get "/api/v1/items/#{item1.id}"

      expect(response).to be_success

      item = JSON.parse(response.body)

      expect(item["id"]).to eq(item1.id)
      expect(item["name"]).to eq("item1")
      expect(item["description"]).to eq("description1")
      expect(item["image_url"]).to eq("image_url1")
      expect(item["created_at"]).to be_nil
      expect(item["updated_at"]).to be_nil
    end
  end
end

# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at

# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at

# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted

# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at