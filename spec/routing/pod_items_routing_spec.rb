# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PodItemsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/pod_items').to route_to('pod_items#index')
    end

    it 'routes to #show' do
      expect(get: '/pod_items/1').to route_to('pod_items#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/pod_items').to route_to('pod_items#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/pod_items/1').to route_to('pod_items#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/pod_items/1').to route_to('pod_items#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/pod_items/1').to route_to('pod_items#destroy', id: '1')
    end
  end
end
