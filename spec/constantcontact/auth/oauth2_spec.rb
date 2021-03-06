#
# oauth2_spec.rb
# ConstantContact
#
# Copyright (c) 2013 Constant Contact. All rights reserved.

require 'spec_helper'

describe ConstantContact::Auth::OAuth2 do
	describe "#new" do
		it "fails without arguments" do
			lambda {
				ConstantContact::Auth::OAuth2.new
			}.should raise_error(ArgumentError)
		end

		it "takes one argument" do
			opts = {:api_key => 'api key', :api_secret => 'secret', :redirect_url => 'redirect url'}
			lambda {
				ConstantContact::Auth::OAuth2.new(opts)
			}.should_not raise_error(ArgumentError)
		end
	end

	describe "#get_authorization_url" do
		before(:each) do
			opts = {:api_key => 'api key', :api_secret => 'secret', :redirect_url => 'redirect url'}
			@auth = ConstantContact::Auth::OAuth2.new(opts)
		end

		it "returns a string" do
			@auth.get_authorization_url.should be_kind_of(String)
		end
	end

	describe "#get_access_token" do
		before(:each) do
			opts = {:api_key => 'api key', :api_secret => 'secret', :redirect_url => 'redirect url'}
			@auth = ConstantContact::Auth::OAuth2.new(opts)
		end

		it "returns a Hash" do
			json = load_json('access_token.json')
			RestClient.stub(:post).and_return(json)
			@auth.get_access_token('token').should be_kind_of(Hash)
		end
	end
end