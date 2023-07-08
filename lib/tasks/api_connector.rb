# lib/api_connector.rb
require 'httparty'

class ApiConnector
  include HTTParty
  base_uri 'http://other-api.com' # Replace with the base URL of the other API

  def initialize(api_key)
    @options = {
      headers: {
        'Authorization' => "Bearer #{api_key}",
        'Content-Type' => 'application/json'
      }
    }
  end

  def request_data(endpoint, method = :get, data = {})
    @options[:body] = data.to_json unless data.empty?

    case method
    when :get
      response = self.class.get(endpoint, @options)
    when :post
      response = self.class.post(endpoint, @options)
    else
      raise ArgumentError, "Invalid request method"
    end

    response.parsed_response
  end
end
