require 'rails_helper'


RSpec.describe "/packaging_details", type: :request do

  let(:valid_attributes) do {
    package_type: Faker::Name.name,
    weight: Faker::Number.number(digits: 2),
    length: Faker::Number.number(digits: 2),
    width: Faker::Number.number(digits: 2),
    height: Faker::Number.number(digits: 2),
    cbm: Faker::Name.name
  }
  end

  let(:invalid_attributes) {
    {
      package_type: Faker::Lorem.sentences,
      weight: nil,
      length: Faker::Number.number(digits: 2),
      width: Faker::Number.number(digits: 2),
      height: Faker::Number.number(digits: 2),
      cbm: Faker::Lorem.sentences
    }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      PackagingDetail.create! valid_attributes
      get packaging_details_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      packaging_detail = PackagingDetail.create! valid_attributes
      get packaging_detail_url(packaging_detail), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new PackagingDetail" do
        expect {
          post packaging_details_url,
               params: { packaging_detail: valid_attributes }, headers: valid_headers, as: :json
        }.to change(PackagingDetail, :count).by(1)
      end

      it "renders a JSON response with the new packaging_detail" do
        post packaging_details_url,
             params: { packaging_detail: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new PackagingDetail" do
        expect {
          post packaging_details_url,
               params: { packaging_detail: invalid_attributes }, as: :json
        }.to change(PackagingDetail, :count).by(0)
      end

      it "renders a JSON response with errors for the new packaging_detail" do
        post packaging_details_url,
             params: { packaging_detail: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          package_type: Faker::Name.name
        }
      }

      it "updates the requested packaging_detail" do
        packaging_detail = PackagingDetail.create! valid_attributes
        patch packaging_detail_url(packaging_detail),
              params: { packaging_detail: new_attributes }, headers: valid_headers, as: :json
        packaging_detail.reload
        expect(packaging_detail.package_type).to eq new_attributes[:package_type]
      end

      it "renders a JSON response with the packaging_detail" do
        packaging_detail = PackagingDetail.create! valid_attributes
        patch packaging_detail_url(packaging_detail),
              params: { packaging_detail: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the packaging_detail" do
        packaging_detail = PackagingDetail.create! valid_attributes
        patch packaging_detail_url(packaging_detail),
              params: { packaging_detail: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested packaging_detail" do
      packaging_detail = PackagingDetail.create! valid_attributes
      expect {
        delete packaging_detail_url(packaging_detail), headers: valid_headers, as: :json
      }.to change(PackagingDetail, :count).by(-1)
    end
  end
end
