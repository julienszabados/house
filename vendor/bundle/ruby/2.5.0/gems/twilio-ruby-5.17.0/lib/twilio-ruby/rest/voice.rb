##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Voice < Domain
      ##
      # Initialize the Voice Domain
      def initialize(twilio)
        super

        @base_url = 'https://voice.twilio.com'
        @host = 'voice.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of voice
      def v1
        @v1 ||= V1.new self
      end

      ##
      # @return [Twilio::REST::Voice::V1::VoicePermissionInstance]
      def voice_permissions
        self.v1.voice_permissions()
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::Voice>'
      end
    end
  end
end