# frozen_string_literal: true

require "spec_helper"

describe OmniAuth::Strategies::NitroId do
  let(:access_token) { instance_double("AccessToken", :options => {}, :[] => "user") }
  let(:custom_client) do
    OmniAuth::Strategies::NitroId.new(:test_app,
                                      issuer: "https://example-host.com/",
                                      discovery: false,
                                      client_options: {
                                        host: "example-host.com",
                                      })
  end

  subject do
    OmniAuth::Strategies::NitroId.new({})
  end

  before(:each) do
    allow(subject).to receive(:access_token).and_return(access_token)
  end

  context "options" do
    it "should have correct name" do
      expect(subject.options.name).to eq "nitro_id"
    end

    it "should have correct host" do
      expect(subject.options.client_options.host).to eq "id.powerhrg.com"
    end

    it "should have correct issuer" do
      expect(subject.options.issuer).to eq "https://id.powerhrg.com/"
    end

    it "should have the correct discovery setting" do
      expect(subject.options.discovery).to eq true
    end

    describe "should be overrideable" do
      it "for host" do
        expect(custom_client.options.client_options.host).to eq "example-host.com"
      end

      it "for issuer" do
        expect(custom_client.options.issuer).to eq "https://example-host.com/"
      end

      it "for discovery" do
        expect(custom_client.options.discovery).to eq false
      end
    end
  end
end
