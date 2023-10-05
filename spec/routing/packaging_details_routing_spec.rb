# frozen_string_literal: true

require "rails_helper"

RSpec.describe PackagingDetailsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/packaging_details").to route_to("packaging_details#index")
    end

    it "routes to #show" do
      expect(get: "/packaging_details/1").to route_to("packaging_details#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/packaging_details").to route_to("packaging_details#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/packaging_details/1").to route_to("packaging_details#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/packaging_details/1").to route_to("packaging_details#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/packaging_details/1").to route_to("packaging_details#destroy", id: "1")
    end
  end
end
