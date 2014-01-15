describe Doorkeeper::LogoutRedirect do

  class ApplicationController
    def redirect_to(options = {}, response_status = {})
      puts "--> redirecting to #{options}"
    end
  end

  class AuthorizationsController < ApplicationController
    attr_accessor :redirect_uri

    def initialize(attributes = {})
      self.redirect_uri = attributes[:redirect_uri]
    end

    def authorize
      redirect_to redirect_uri
    end
  end

  class Doorkeeper::Application
    def self.pluck(key = nil)
      ['https://testapplication.com/test/endpoint', 'https://testapplication2.com/test/endpoint2']
    end
  end

  before(:each) do
    AuthorizationsController.send(:include, subject)
  end

  context 'a login request for an oauth application' do
    let(:auth_controller) { AuthorizationsController.new(redirect_uri: Doorkeeper::Application.pluck.first) }

    it 'logs out before redirecting to the oauth application' do
      expect(auth_controller).to receive(:logout)
      auth_controller.authorize
    end
  end

  context 'a login request for another oauth application' do
    let(:auth_controller) { AuthorizationsController.new(redirect_uri:  Doorkeeper::Application.pluck.last) }

    it 'logs out before redirecting to the oauth application' do
      expect(auth_controller).to receive(:logout)
      auth_controller.authorize
    end
  end

  context 'a login request for a non-oauth application' do
    let(:auth_controller) { AuthorizationsController.new(redirect_uri: 'https://notatestapp.com/test/endpoint') }

    it 'does not log out before redirecting' do
      expect(ApplicationController.any_instance).to_not receive(:logout)
      auth_controller.authorize
    end
  end
end