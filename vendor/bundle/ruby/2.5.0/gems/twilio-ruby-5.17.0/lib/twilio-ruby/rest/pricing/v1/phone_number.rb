##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Pricing < Domain
      class V1 < Version
        class PhoneNumberList < ListResource
          ##
          # Initialize the PhoneNumberList
          # @param [Version] version Version that contains the resource
          # @return [PhoneNumberList] PhoneNumberList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}

            # Components
            @countries = nil
          end

          ##
          # Access the countries
          # @param [String] iso_country The iso_country
          # @return [CountryList]
          # @return [CountryContext] if iso_country was passed.
          def countries(iso_country=:unset)
            raise ArgumentError, 'iso_country cannot be nil' if iso_country.nil?

            if iso_country != :unset
              return CountryContext.new(@version, iso_country, )
            end

              @countries ||= CountryList.new(@version, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Pricing.V1.PhoneNumberList>'
          end
        end

        class PhoneNumberPage < Page
          ##
          # Initialize the PhoneNumberPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [PhoneNumberPage] PhoneNumberPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of PhoneNumberInstance
          # @param [Hash] payload Payload response from the API
          # @return [PhoneNumberInstance] PhoneNumberInstance
          def get_instance(payload)
            PhoneNumberInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Pricing.V1.PhoneNumberPage>'
          end
        end

        class PhoneNumberInstance < InstanceResource
          ##
          # Initialize the PhoneNumberInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @return [PhoneNumberInstance] PhoneNumberInstance
          def initialize(version, payload)
            super(version)

            # Marshaled Properties
            @properties = {'name' => payload['name'], 'url' => payload['url'], 'links' => payload['links'], }
          end

          ##
          # @return [String] The name
          def name
            @properties['name']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # @return [String] The links
          def links
            @properties['links']
          end

          ##
          # Provide a user friendly representation
          def to_s
            "<Twilio.Pricing.V1.PhoneNumberInstance>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            "<Twilio.Pricing.V1.PhoneNumberInstance>"
          end
        end
      end
    end
  end
end