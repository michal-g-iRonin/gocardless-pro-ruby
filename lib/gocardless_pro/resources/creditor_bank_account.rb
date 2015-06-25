

# encoding: utf-8
#
# WARNING: Do not edit by hand, this file was generated by Crank:
#
#   https://github.com/gocardless/crank
#
require 'uri'

module GoCardlessPro
  # A module containing classes for each of the resources in the GC Api
  module Resources
    # Creditor Bank Accounts hold the bank details of a
    # [creditor](#core-endpoints-creditor). These are the bank accounts which your
    # [payouts](#core-endpoints-payouts) will be sent to.
    #
    # Note that
    # creditor bank accounts must be unique, and so you will encounter a
    # `bank_account_exists` error if you try to create a duplicate bank account.
    # You may wish to handle this by updating the existing record instead, the ID
    # of which will be provided as `links[creditor_bank_account]` in the error
    # response.
    # Represents an instance of a creditor_bank_account resource returned from the API
    class CreditorBankAccount
      attr_reader :account_holder_name

      attr_reader :account_number_ending

      attr_reader :bank_name

      attr_reader :country_code

      attr_reader :created_at

      attr_reader :currency

      attr_reader :enabled

      attr_reader :id

      attr_reader :metadata
      # initialize a resource instance
      # @param object [Hash] an object returned from the API
      def initialize(object)
        @object = object

        @account_holder_name = object['account_holder_name']
        @account_number_ending = object['account_number_ending']
        @bank_name = object['bank_name']
        @country_code = object['country_code']
        @created_at = object['created_at']
        @currency = object['currency']
        @enabled = object['enabled']
        @id = object['id']
        @links = object['links']
        @metadata = object['metadata']
      end

      # return the links that the resource has
      def links
        Struct.new(
          *{

            creditor: ''

          }.keys.sort
        ).new(*@links.sort.map(&:last))
      end

      # Provides the resource as a hash of all it's readable attributes
      def to_h
        @object
      end
    end
  end
end
