require 'rails_helper'


RSpec.describe "/items", type: :request do

  let(:valid_attributes) do {
    position: Faker::Number.number(digits: 2),
    item_no: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    sales_order_no: Faker::Name.name ,
    unit: Faker::Lorem.sentence,

  } end

  let(:invalid_attributes) do {
    position: Faker::Number.number(digits: 2),
    item_no: nil,
    description: Faker::Lorem.sentence,
    sales_order_no: Faker::Name.name ,
    unit: nil,

  } end

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Item.create! valid_attributes
      get items_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      item = Item.create! valid_attributes
      get item_url(item), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Item" do
        expect {
          post items_url,
               params: { item: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Item, :count).by(1)
      end

      it "renders a JSON response with the new item" do
        post items_url,
             params: { item: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Item" do
        expect {
          post items_url,
               params: { item: invalid_attributes }, as: :json
        }.to change(Item, :count).by(0)
      end

      it "renders a JSON response with errors for the new item" do
        post items_url,
             params: { item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          position: Faker::Number.number(digits: 2)
        }
      }

      it "updates the requested item" do
        item = Item.create! valid_attributes
        patch item_url(item),
              params: { item: new_attributes }, headers: valid_headers, as: :json
        item.reload
        expect(item.position).to eq new_attributes[:position]
      end

      it "renders a JSON response with the item" do
        item = Item.create! valid_attributes
        patch item_url(item),
              params: { item: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the item" do
        item = Item.create! valid_attributes
        patch item_url(item),
              params: { item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested item" do
      item = Item.create! valid_attributes
      expect {
        delete item_url(item), headers: valid_headers, as: :json
      }.to change(Item, :count).by(-1)
    end
  end
end
