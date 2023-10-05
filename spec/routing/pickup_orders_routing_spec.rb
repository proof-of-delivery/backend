# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PickupOrdersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/pickup_orders').to route_to('pickup_orders#index')
    end

    it 'routes to #show' do
      expect(get: '/pickup_orders/1').to route_to('pickup_orders#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/pickup_orders').to route_to('pickup_orders#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/pickup_orders/1').to route_to('pickup_orders#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/pickup_orders/1').to route_to('pickup_orders#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/pickup_orders/1').to route_to('pickup_orders#destroy', id: '1')
    end
  end
end
