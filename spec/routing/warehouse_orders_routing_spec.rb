# frozen_string_literal: true

require "rails_helper"

RSpec.describe WarehouseOrdersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/warehouse_orders").to route_to("warehouse_orders#index")
    end

    it "routes to #show" do
      expect(get: "/warehouse_orders/1").to route_to("warehouse_orders#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/warehouse_orders").to route_to("warehouse_orders#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/warehouse_orders/1").to route_to("warehouse_orders#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/warehouse_orders/1").to route_to("warehouse_orders#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/warehouse_orders/1").to route_to("warehouse_orders#destroy", id: "1")
    end
  end
end
