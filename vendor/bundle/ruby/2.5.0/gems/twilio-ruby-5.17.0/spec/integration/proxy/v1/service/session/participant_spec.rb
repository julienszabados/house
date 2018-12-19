##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Participant' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .participants('KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://proxy.twilio.com/v1/Services/KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Sessions/KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identifier": "identifier",
          "proxy_identifier": "proxy_identifier",
          "proxy_identifier_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "date_deleted": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "date_created": "2015-07-30T20:00:00Z",
          "url": "https://proxy.twilio.com/v1/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "message_interactions": "https://proxy.twilio.com/v1/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/MessageInteractions"
          }
      }
      ]
    ))

    actual = @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .participants('KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .participants.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://proxy.twilio.com/v1/Services/KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Sessions/KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "previous_page_url": null,
              "next_page_url": null,
              "url": "https://proxy.twilio.com/v1/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
              "page": 0,
              "first_page_url": "https://proxy.twilio.com/v1/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
              "page_size": 50,
              "key": "participants"
          },
          "participants": []
      }
      ]
    ))

    actual = @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .participants.list()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .participants.create(identifier: 'identifier')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Identifier' => 'identifier', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://proxy.twilio.com/v1/Services/KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Sessions/KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identifier": "identifier",
          "proxy_identifier": "proxy_identifier",
          "proxy_identifier_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "date_deleted": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "date_created": "2015-07-30T20:00:00Z",
          "url": "https://proxy.twilio.com/v1/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "message_interactions": "https://proxy.twilio.com/v1/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/MessageInteractions"
          }
      }
      ]
    ))

    actual = @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .participants.create(identifier: 'identifier')

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                      .participants('KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://proxy.twilio.com/v1/Services/KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Sessions/KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.proxy.v1.services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .participants('KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end