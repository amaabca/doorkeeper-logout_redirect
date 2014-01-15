# Doorkeeper::LogoutRedirect

Some OAuth providers may not want to keep a user persistently logged in to their provider app
when a user is logging in to an authorized consumer application.


This gem allows an application using Doorkeeper to log users out before redirecting after a successful
authentication, if the login was on behalf of a registered OAuth application.

## Installation

Add this line to your application's Gemfile:

    gem 'doorkeeper-logout_redirect'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doorkeeper-logout_redirect

## Usage

In your app, add the following to config/application.rb:

    config.to_prepare do
       Doorkeeper::AuthorizationsController.send(:include, Doorkeeper::LogoutRedirect)
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Run bundle exec rake and ensure that tests pass
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
