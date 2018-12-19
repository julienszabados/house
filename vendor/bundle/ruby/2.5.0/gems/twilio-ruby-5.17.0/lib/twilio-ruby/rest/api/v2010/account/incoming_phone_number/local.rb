##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class IncomingPhoneNumberList < ListResource
            class LocalList < ListResource
              ##
              # Initialize the LocalList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The unique id of the
              #   [Account](https://www.twilio.com/docs/iam/api/account) responsible for this
              #   phone number.
              # @return [LocalList] LocalList
              def initialize(version, account_sid: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid}
                @uri = "/Accounts/#{@solution[:account_sid]}/IncomingPhoneNumbers/Local.json"
              end

              ##
              # Lists LocalInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Boolean] beta Include phone numbers new to the Twilio platform. Possible
              #   values are either `true` or `false`. Default is `true`.
              # @param [String] friendly_name Only show the incoming phone number resources with
              #   friendly names that exactly match this name.
              # @param [String] phone_number Only show the incoming phone number resources that
              #   match this pattern. You can specify partial numbers and use '*' as a wildcard
              #   for any digit.
              # @param [String] origin Include phone numbers based on the origin, by default,
              #   phone numbers of all origin are included. Possible values are either `twilio` or
              #   `hosted`.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(beta: :unset, friendly_name: :unset, phone_number: :unset, origin: :unset, limit: nil, page_size: nil)
                self.stream(
                    beta: beta,
                    friendly_name: friendly_name,
                    phone_number: phone_number,
                    origin: origin,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams LocalInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Boolean] beta Include phone numbers new to the Twilio platform. Possible
              #   values are either `true` or `false`. Default is `true`.
              # @param [String] friendly_name Only show the incoming phone number resources with
              #   friendly names that exactly match this name.
              # @param [String] phone_number Only show the incoming phone number resources that
              #   match this pattern. You can specify partial numbers and use '*' as a wildcard
              #   for any digit.
              # @param [String] origin Include phone numbers based on the origin, by default,
              #   phone numbers of all origin are included. Possible values are either `twilio` or
              #   `hosted`.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(beta: :unset, friendly_name: :unset, phone_number: :unset, origin: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    beta: beta,
                    friendly_name: friendly_name,
                    phone_number: phone_number,
                    origin: origin,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields LocalInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              def each
                limits = @version.read_limits

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of LocalInstance records from the API.
              # Request is executed immediately.
              # @param [Boolean] beta Include phone numbers new to the Twilio platform. Possible
              #   values are either `true` or `false`. Default is `true`.
              # @param [String] friendly_name Only show the incoming phone number resources with
              #   friendly names that exactly match this name.
              # @param [String] phone_number Only show the incoming phone number resources that
              #   match this pattern. You can specify partial numbers and use '*' as a wildcard
              #   for any digit.
              # @param [String] origin Include phone numbers based on the origin, by default,
              #   phone numbers of all origin are included. Possible values are either `twilio` or
              #   `hosted`.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of LocalInstance
              def page(beta: :unset, friendly_name: :unset, phone_number: :unset, origin: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'Beta' => beta,
                    'FriendlyName' => friendly_name,
                    'PhoneNumber' => phone_number,
                    'Origin' => origin,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                LocalPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of LocalInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of LocalInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                LocalPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of LocalInstance records from the API.
              # Request is executed immediately.
              # @param [String] phone_number The phone number you want to purchase. The number
              #   should be formatted starting with a '+' followed by the country code and the
              #   number in [E.164](http://en.wikipedia.org/wiki/E.164) format e.g.,
              #   '+15105555555'. **You must include either this or an `AreaCode` parameter to
              #   have your POST succeed.**
              # @param [String] api_version The Twilio REST API version to use for incoming
              #   calls made to this number. If omitted, uses `2010-04-01`.
              # @param [String] friendly_name A human readable description of the new incoming
              #   phone number. Maximum 64 characters. Defaults to a formatted version of the
              #   number.
              # @param [String] sms_application_sid The 34 character sid of the application
              #   Twilio should use to handle SMSs sent to the new number. If a
              #   `SmsApplicationSid` is present, Twilio will ignore all of the SMS urls above and
              #   use those set on the application.
              # @param [String] sms_fallback_method The HTTP method that should be used to
              #   request the `SmsFallbackUrl`. Must be either `GET` or `POST`. Defaults to
              #   `POST`.
              # @param [String] sms_fallback_url A URL that Twilio will request if an error
              #   occurs requesting or executing the TwiML defined by `SmsUrl`.
              # @param [String] sms_method The HTTP method that should be used to request the
              #   `SmsUrl`. Must be either `GET` or `POST`. Defaults to `POST`.
              # @param [String] sms_url The URL that Twilio should request when somebody sends
              #   an SMS to the phone number.
              # @param [String] status_callback The URL that Twilio will request to pass status
              #   parameters (such as call ended) to your application.
              # @param [String] status_callback_method The HTTP method Twilio will use to make
              #   requests to the `StatusCallback` URL. Either `GET` or `POST`. Defaults to
              #   `POST`.
              # @param [String] voice_application_sid The 34 character sid of the application
              #   Twilio should use to handle phone calls to the new number. If a
              #   `VoiceApplicationSid` is present, Twilio will ignore all of the voice urls above
              #   and use those set on the application. Setting a `VoiceApplicationSid` will
              #   automatically delete your `TrunkSid` and vice versa.
              # @param [Boolean] voice_caller_id_lookup Do a lookup of a caller's name from the
              #   CNAM database and post it to your app. Either `true` or `false`. Defaults to
              #   `false`.
              # @param [String] voice_fallback_method The HTTP method that should be used to
              #   request the `VoiceFallbackUrl`. Either `GET` or `POST`. Defaults to `POST`.
              # @param [String] voice_fallback_url A URL that Twilio will request if an error
              #   occurs requesting or executing the TwiML at `Url`.
              # @param [String] voice_method The HTTP method that should be used to request the
              #   `VoiceUrl`. Must be either `GET` or `POST`. Defaults to `POST`.
              # @param [String] voice_url The URL that Twilio should request when somebody dials
              #   the new phone number. The VoiceURL will  no longer be used if a
              #   `VoiceApplicationSid` or a `TrunkSid` is set.
              # @param [String] identity_sid The identity_sid
              # @param [String] address_sid The 34 character sid of the address Twilio should
              #   associate with the number.
              # @return [LocalInstance] Newly created LocalInstance
              def create(phone_number: nil, api_version: :unset, friendly_name: :unset, sms_application_sid: :unset, sms_fallback_method: :unset, sms_fallback_url: :unset, sms_method: :unset, sms_url: :unset, status_callback: :unset, status_callback_method: :unset, voice_application_sid: :unset, voice_caller_id_lookup: :unset, voice_fallback_method: :unset, voice_fallback_url: :unset, voice_method: :unset, voice_url: :unset, identity_sid: :unset, address_sid: :unset)
                data = Twilio::Values.of({
                    'PhoneNumber' => phone_number,
                    'ApiVersion' => api_version,
                    'FriendlyName' => friendly_name,
                    'SmsApplicationSid' => sms_application_sid,
                    'SmsFallbackMethod' => sms_fallback_method,
                    'SmsFallbackUrl' => sms_fallback_url,
                    'SmsMethod' => sms_method,
                    'SmsUrl' => sms_url,
                    'StatusCallback' => status_callback,
                    'StatusCallbackMethod' => status_callback_method,
                    'VoiceApplicationSid' => voice_application_sid,
                    'VoiceCallerIdLookup' => voice_caller_id_lookup,
                    'VoiceFallbackMethod' => voice_fallback_method,
                    'VoiceFallbackUrl' => voice_fallback_url,
                    'VoiceMethod' => voice_method,
                    'VoiceUrl' => voice_url,
                    'IdentitySid' => identity_sid,
                    'AddressSid' => address_sid,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                LocalInstance.new(@version, payload, account_sid: @solution[:account_sid], )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.LocalList>'
              end
            end

            class LocalPage < Page
              ##
              # Initialize the LocalPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [LocalPage] LocalPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of LocalInstance
              # @param [Hash] payload Payload response from the API
              # @return [LocalInstance] LocalInstance
              def get_instance(payload)
                LocalInstance.new(@version, payload, account_sid: @solution[:account_sid], )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.LocalPage>'
              end
            end

            class LocalInstance < InstanceResource
              ##
              # Initialize the LocalInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The unique id of the
              #   [Account](https://www.twilio.com/docs/iam/api/account) responsible for this
              #   phone number.
              # @return [LocalInstance] LocalInstance
              def initialize(version, payload, account_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'address_sid' => payload['address_sid'],
                    'address_requirements' => payload['address_requirements'],
                    'api_version' => payload['api_version'],
                    'beta' => payload['beta'],
                    'capabilities' => payload['capabilities'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'friendly_name' => payload['friendly_name'],
                    'identity_sid' => payload['identity_sid'],
                    'phone_number' => payload['phone_number'],
                    'origin' => payload['origin'],
                    'sid' => payload['sid'],
                    'sms_application_sid' => payload['sms_application_sid'],
                    'sms_fallback_method' => payload['sms_fallback_method'],
                    'sms_fallback_url' => payload['sms_fallback_url'],
                    'sms_method' => payload['sms_method'],
                    'sms_url' => payload['sms_url'],
                    'status_callback' => payload['status_callback'],
                    'status_callback_method' => payload['status_callback_method'],
                    'trunk_sid' => payload['trunk_sid'],
                    'uri' => payload['uri'],
                    'voice_application_sid' => payload['voice_application_sid'],
                    'voice_caller_id_lookup' => payload['voice_caller_id_lookup'],
                    'voice_fallback_method' => payload['voice_fallback_method'],
                    'voice_fallback_url' => payload['voice_fallback_url'],
                    'voice_method' => payload['voice_method'],
                    'voice_url' => payload['voice_url'],
                }
              end

              ##
              # @return [String] The unique id of the Account responsible for this phone number.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The 34 character sid of the address associated with this number.
              def address_sid
                @properties['address_sid']
              end

              ##
              # @return [local.AddressRequirement] This indicates whether the phone number requires you or your customer to have an Address registered with Twilio.
              def address_requirements
                @properties['address_requirements']
              end

              ##
              # @return [String] Calls to this phone number will start a new TwiML session with this API version.
              def api_version
                @properties['api_version']
              end

              ##
              # @return [Boolean] Phone numbers new to the Twilio platform are marked as beta.
              def beta
                @properties['beta']
              end

              ##
              # @return [String] This is a set of boolean properties that indicate whether a phone number can receive calls or messages.
              def capabilities
                @properties['capabilities']
              end

              ##
              # @return [Time] The date that this resource was created, given as GMT RFC 2822 format.
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date that this resource was last updated, given as GMT RFC 2822 format.
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] A human readable descriptive text for this resource, up to 64 characters long.
              def friendly_name
                @properties['friendly_name']
              end

              ##
              # @return [String] The identity_sid
              def identity_sid
                @properties['identity_sid']
              end

              ##
              # @return [String] The incoming phone number.
              def phone_number
                @properties['phone_number']
              end

              ##
              # @return [String] Twilio owned phone numbers are marked as twilio while hosted phone numbers are marked as hosted.
              def origin
                @properties['origin']
              end

              ##
              # @return [String] A 34 character string that uniquely identifies this resource.
              def sid
                @properties['sid']
              end

              ##
              # @return [String] The 34 character sid of the application Twilio should use to handle SMSs sent to this number.
              def sms_application_sid
                @properties['sms_application_sid']
              end

              ##
              # @return [String] The HTTP method Twilio will use when requesting the above URL.
              def sms_fallback_method
                @properties['sms_fallback_method']
              end

              ##
              # @return [String] The URL that Twilio will request if an error occurs retrieving or executing the TwiML from SmsUrl.
              def sms_fallback_url
                @properties['sms_fallback_url']
              end

              ##
              # @return [String] The HTTP method Twilio will use when making requests to the SmsUrl.
              def sms_method
                @properties['sms_method']
              end

              ##
              # @return [String] The URL Twilio will request when receiving an incoming SMS message to this number.
              def sms_url
                @properties['sms_url']
              end

              ##
              # @return [String] The URL that Twilio will request to pass status parameters to your application.
              def status_callback
                @properties['status_callback']
              end

              ##
              # @return [String] The HTTP method Twilio will use to make requests to the StatusCallback URL.
              def status_callback_method
                @properties['status_callback_method']
              end

              ##
              # @return [String] The 34 character sid of the Trunk Twilio should use to handle phone calls to this number.
              def trunk_sid
                @properties['trunk_sid']
              end

              ##
              # @return [String] The URI for this resource, relative to https://api.
              def uri
                @properties['uri']
              end

              ##
              # @return [String] The 34 character sid of the application Twilio should use to handle phone calls to this number.
              def voice_application_sid
                @properties['voice_application_sid']
              end

              ##
              # @return [Boolean] Look up the caller's caller-ID name from the CNAM database.
              def voice_caller_id_lookup
                @properties['voice_caller_id_lookup']
              end

              ##
              # @return [String] The HTTP method Twilio will use when requesting the VoiceFallbackUrl.
              def voice_fallback_method
                @properties['voice_fallback_method']
              end

              ##
              # @return [String] The URL that Twilio will request if an error occurs retrieving or executing the TwiML requested by Url.
              def voice_fallback_url
                @properties['voice_fallback_url']
              end

              ##
              # @return [String] The HTTP method Twilio will use when requesting the above Url.
              def voice_method
                @properties['voice_method']
              end

              ##
              # @return [String] The URL Twilio will request when this phone number receives a call.
              def voice_url
                @properties['voice_url']
              end

              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Api.V2010.LocalInstance>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                "<Twilio.Api.V2010.LocalInstance>"
              end
            end
          end
        end
      end
    end
  end
end