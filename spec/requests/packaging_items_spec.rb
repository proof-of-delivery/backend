# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/packaging_items", type: :request do
  let(:valid_attributes) do
    {
      packaging_detail_id: create(:packaging_detail).id,
      pickup_item_id: create(:pickup_item).id,
      quantity: Faker::Number.number(digits: 2)
    }
  end

  let(:invalid_attributes) do
    {
      packaging_detail_id: nil,
      pickup_item_id: nil,
      quantity: Faker::Number.number(digits: 2)
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # PackagingItemsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe "GET /index" do
    it "renders a successful response" do
      PackagingItem.create! valid_attributes
      get packaging_items_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      packaging_item = PackagingItem.create! valid_attributes
      get packaging_item_url(packaging_item), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new PackagingItem" do
        expect do
          post packaging_items_url,
            params: {packaging_item: valid_attributes}, headers: valid_headers, as: :json
        end.to change(PackagingItem, :count).by(1)
      end

      it "renders a JSON response with the new packaging_item" do
        post packaging_items_url,
          params: {packaging_item: valid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new PackagingItem" do
        expect do
          post packaging_items_url,
            params: {packaging_item: invalid_attributes}, as: :json
        end.to change(PackagingItem, :count).by(0)
      end

      it "renders a JSON response with errors for the new packaging_item" do
        post packaging_items_url,
          params: {packaging_item: invalid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          quantity: Faker::Number.number(digits: 2)
        }
      end

      it "updates the requested packaging_item" do
        packaging_item = PackagingItem.create! valid_attributes
        patch packaging_item_url(packaging_item),
          params: {packaging_item: new_attributes}, headers: valid_headers, as: :json
        packaging_item.reload
        expect(packaging_item.quantity).to eq new_attributes[:quantity]
      end

      it "renders a JSON response with the packaging_item" do
        packaging_item = PackagingItem.create! valid_attributes
        patch packaging_item_url(packaging_item),
          params: {packaging_item: new_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the packaging_item" do
        packaging_item = PackagingItem.create! valid_attributes
        patch packaging_item_url(packaging_item),
          params: {packaging_item: invalid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested packaging_item" do
      packaging_item = PackagingItem.create! valid_attributes
      expect do
        delete packaging_item_url(packaging_item), headers: valid_headers, as: :json
      end.to change(PackagingItem, :count).by(-1)
    end
  end
end
