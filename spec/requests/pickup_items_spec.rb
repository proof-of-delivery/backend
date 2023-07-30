require 'rails_helper'

RSpec.describe "/pickup_items", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # PickupItem. As you add validations to PickupItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do {
    pickup_order_id: create(:pickup_order).id,
    item_id: create(:item).id,
    warehouse_item_id: create(:warehouse_item).id,
    quantity: Faker::Number.number(digits: 2)
  }
  end

  let(:invalid_attributes) {
    {
      pickup_order_id:nil,
      item_id: nil,
      warehouse_item_id: nil,
      quantity: Faker::Number.number(digits: 2)
    }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # PickupItemsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      PickupItem.create! valid_attributes
      get pickup_items_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      pickup_item = PickupItem.create! valid_attributes
      get pickup_item_url(pickup_item), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new PickupItem" do
        expect {
          post pickup_items_url,
               params: { pickup_item: valid_attributes }, headers: valid_headers, as: :json
        }.to change(PickupItem, :count).by(1)
      end

      it "renders a JSON response with the new pickup_item" do
        post pickup_items_url,
             params: { pickup_item: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new PickupItem" do
        expect {
          post pickup_items_url,
               params: { pickup_item: invalid_attributes }, as: :json
        }.to change(PickupItem, :count).by(0)
      end

      it "renders a JSON response with errors for the new pickup_item" do
        post pickup_items_url,
             params: { pickup_item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          quantity: Faker::Number.number(digits: 2)
        }
      }

      it "updates the requested pickup_item" do
        pickup_item = PickupItem.create! valid_attributes
        patch pickup_item_url(pickup_item),
              params: { pickup_item: new_attributes }, headers: valid_headers, as: :json
        pickup_item.reload
        expect(pickup_item.quantity).to eq new_attributes[:quantity]
      end

      it "renders a JSON response with the pickup_item" do
        pickup_item = PickupItem.create! valid_attributes
        patch pickup_item_url(pickup_item),
              params: { pickup_item: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the pickup_item" do
        pickup_item = PickupItem.create! valid_attributes
        patch pickup_item_url(pickup_item),
              params: { pickup_item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested pickup_item" do
      pickup_item = PickupItem.create! valid_attributes
      expect {
        delete pickup_item_url(pickup_item), headers: valid_headers, as: :json
      }.to change(PickupItem, :count).by(-1)
    end
  end
end
