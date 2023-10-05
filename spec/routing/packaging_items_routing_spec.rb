# frozen_string_literal: true

require "rails_helper"

RSpec.describe PackagingItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/packaging_items").to route_to("packaging_items#index")
    end

    it "routes to #show" do
      expect(get: "/packaging_items/1").to route_to("packaging_items#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/packaging_items").to route_to("packaging_items#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/packaging_items/1").to route_to("packaging_items#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/packaging_items/1").to route_to("packaging_items#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/packaging_items/1").to route_to("packaging_items#destroy", id: "1")
    end
  end
end
