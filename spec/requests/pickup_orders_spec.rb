require 'rails_helper'

RSpec.describe "/pickup_orders", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # PickupOrder. As you add validations to PickupOrder, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do {
    customer_id: create(:customer).id,
    pickup_date: Faker::Date.in_date_period,
    pickup_time: Faker::Name.name,
    pickup_order_no: Faker::Name.name,
    contact_id: create(:contact).id
  }
  end

  let(:invalid_attributes) {
    {
      customer_id: nil,
      pickup_date: Faker::Date.in_date_period,
      pickup_time: nil,
      pickup_order_no: Faker::Name.name,
      contact_id: nil
    }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # PickupOrdersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      PickupOrder.create! valid_attributes
      get pickup_orders_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      pickup_order = PickupOrder.create! valid_attributes
      get pickup_order_url(pickup_order), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new PickupOrder" do
        expect {
          post pickup_orders_url,
               params: { pickup_order: valid_attributes }, headers: valid_headers, as: :json
        }.to change(PickupOrder, :count).by(1)
      end

      it "renders a JSON response with the new pickup_order" do
        post pickup_orders_url,
             params: { pickup_order: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new PickupOrder" do
        expect {
          post pickup_orders_url,
               params: { pickup_order: invalid_attributes }, as: :json
        }.to change(PickupOrder, :count).by(0)
      end

      it "renders a JSON response with errors for the new pickup_order" do
        post pickup_orders_url,
             params: { pickup_order: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          pickup_date: Faker::Date.in_date_period,
        }
      }

      it "updates the requested pickup_order" do
        pickup_order = PickupOrder.create! valid_attributes
        patch pickup_order_url(pickup_order),
              params: { pickup_order: new_attributes }, headers: valid_headers, as: :json
        pickup_order.reload
        expect(pickup_order.pickup_date).to eq new_attributes[:pickup_date]
      end

      it "renders a JSON response with the pickup_order" do
        pickup_order = PickupOrder.create! valid_attributes
        patch pickup_order_url(pickup_order),
              params: { pickup_order: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the pickup_order" do
        pickup_order = PickupOrder.create! valid_attributes
        patch pickup_order_url(pickup_order),
              params: { pickup_order: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested pickup_order" do
      pickup_order = PickupOrder.create! valid_attributes
      expect {
        delete pickup_order_url(pickup_order), headers: valid_headers, as: :json
      }.to change(PickupOrder, :count).by(-1)
    end
  end
end
