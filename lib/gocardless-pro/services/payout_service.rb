require_relative './base_service'

# encoding: utf-8
#
# WARNING: Do not edit by hand, this file was generated by Crank:
#
#   https://github.com/gocardless/crank

module GoCardless
  module Services
    # Service for making requests to the Payout endpoints
    class PayoutService < BaseService
      # Returns a
      # [cursor-paginated](https://developer.gocardless.com/pro/2015-04-29/#overview-cursor-pagination)
      # list of your payouts.
      # Example URL: /payouts
      # @param options [Hash] parameters as a hash. If the request is a GET, these will be converted to query parameters.
      # Else, they will be the body of the request.
      def list(options = {}, custom_headers = {})
        path = '/payouts'

        response = make_request(:get, path, options, custom_headers)
        ListResponse.new(
          raw_response: response,
          unenveloped_body: unenvelope_body(response.body),
          resource_class: Resources::Payout
        )
      end

      # Get a lazily enumerated list of all the items returned. This is simmilar to the `list` method but will paginate for you automatically.
      #
      # @param options [Hash] parameters as a hash. If the request is a GET, these will be converted to query parameters.
      # Otherwise they will be the body of the request.
      def all(options = {})
        Paginator.new(
          service: self,
          path: '/payouts',
          options: options
        ).enumerator
      end

      # Retrieves the details of a single payout.
      # Example URL: /payouts/:identity
      #
      # @param identity       # Unique identifier, beginning with "PO"
      # @param options [Hash] parameters as a hash. If the request is a GET, these will be converted to query parameters.
      # Else, they will be the body of the request.
      def get(identity, options = {}, custom_headers = {})
        path = sub_url('/payouts/:identity',           'identity' => identity)

        response = make_request(:get, path, options, custom_headers)

        Resources::Payout.new(unenvelope_body(response.body))
      end

      # Unenvelope the response of the body using the service's `envelope_key`
      #
      # @param body [Hash]
      def unenvelope_body(body)
        body[envelope_key] || body['data']
      end

      private

      # return the key which API responses will envelope data under
      def envelope_key
        'payouts'
      end

      # take a URL with placeholder params and substitute them out for the acutal value
      # @param url [String] the URL with placeholders in
      # @param param_map [Hash] a hash of placeholders and their actual values
      def sub_url(url, param_map)
        param_map.reduce(url) do |new_url, (param, value)|
          new_url.gsub(":#{param}", value)
        end
      end
    end
  end
end
