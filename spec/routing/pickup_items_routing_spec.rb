# frozen_string_literal: true

require "rails_helper"

RSpec.describe PickupItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/pickup_items").to route_to("pickup_items#index")
    end

    it "routes to #show" do
      expect(get: "/pickup_items/1").to route_to("pickup_items#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/pickup_items").to route_to("pickup_items#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/pickup_items/1").to route_to("pickup_items#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/pickup_items/1").to route_to("pickup_items#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/pickup_items/1").to route_to("pickup_items#destroy", id: "1")
    end
  end
end
