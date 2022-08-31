# frozen_string_literal: true

# config/initializers/cors.rb

# @note: must be run after initializers/_assets.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*"

    # All asset requests should be to rails prefixed assets paths
    # serverd from the asset pipeline (e.g.: "/assets/*" by default)
    resource "*",
      # Allow any request headers to be sent in the asset request
      # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#Access-Control-Allow-Headers
      headers: :any,
      # All asset fetches should be via GET
      # Support OPTIONS for pre-flight requests
      # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#Preflighted_requests
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
