##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Fax
      class V1 < Version
        ##
        # Initialize the V1 version of Fax
        def initialize(domain)
          super
          @version = 'v1'
          @faxes = nil
        end

        ##
        # @param [String] sid A 34 character string that uniquely identifies this fax.
        # @return [Twilio::REST::Fax::V1::FaxContext] if sid was passed.
        # @return [Twilio::REST::Fax::V1::FaxList]
        def faxes(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @faxes ||= FaxList.new self
          else
            FaxContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Fax::V1>'
        end
      end
    end
  end
end