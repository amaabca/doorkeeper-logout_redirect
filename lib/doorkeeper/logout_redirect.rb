require "doorkeeper/logout_redirect/version"

module Doorkeeper
  module LogoutRedirect
    def redirect_to(options = {}, response_status = {})
      logout if matches_application_redirect_uri?(options)
      super
    end

  private
    def matches_application_redirect_uri?(redirect_uri)
      Doorkeeper::Application.pluck(:redirect_uri).each do |uri|
        return true if (redirect_uri =~ /^#{Regexp.escape(uri)}/) == 0
      end
      return false
    end
  end
end