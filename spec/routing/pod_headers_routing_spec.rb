# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PodHeadersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/pod_headers').to route_to('pod_headers#index')
    end

    it 'routes to #show' do
      expect(get: '/pod_headers/1').to route_to('pod_headers#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/pod_headers').to route_to('pod_headers#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/pod_headers/1').to route_to('pod_headers#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/pod_headers/1').to route_to('pod_headers#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/pod_headers/1').to route_to('pod_headers#destroy', id: '1')
    end
  end
end
