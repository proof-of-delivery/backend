require 'rails_helper'


RSpec.describe "/customers", type: :request do

  let(:valid_attributes) do {
    name: Faker::Name.name,
    primary_contact: Faker::PhoneNumber.cell_phone,
    billing_contact: Faker::PhoneNumber.cell_phone,

  } end

  let(:invalid_attributes) do {
    name: Faker::Name.name,
    primary_contact: nil,
    billing_contact: Faker::PhoneNumber.cell_phone,


  } end

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Customer.create! valid_attributes
      get customers_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      customer = Customer.create! valid_attributes
      get customer_url(customer), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Customer" do
        expect {
          post customers_url,
               params: { customer: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Customer, :count).by(1)
      end

      it "renders a JSON response with the new customer" do
        post customers_url,
             params: { customer: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Customer" do
        expect {
          post customers_url,
               params: { customer: invalid_attributes }, as: :json
        }.to change(Customer, :count).by(0)
      end

      it "renders a JSON response with errors for the new customer" do
        post customers_url,
             params: { customer: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested customer" do
        customer = Customer.create! valid_attributes
        patch customer_url(customer),
              params: { customer: new_attributes }, headers: valid_headers, as: :json
        customer.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the customer" do
        customer = Customer.create! valid_attributes
        patch customer_url(customer),
              params: { customer: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the customer" do
        customer = Customer.create! valid_attributes
        patch customer_url(customer),
              params: { customer: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested customer" do
      customer = Customer.create! valid_attributes
      expect {
        delete customer_url(customer), headers: valid_headers, as: :json
      }.to change(Customer, :count).by(-1)
    end
  end
end
