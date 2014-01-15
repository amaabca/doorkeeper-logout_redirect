# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doorkeeper/logout_redirect/version'

Gem::Specification.new do |spec|
  spec.name          = "doorkeeper-logout_redirect"
  spec.version       = Doorkeeper::LogoutRedirect::VERSION
  spec.authors       = ["Michael van den Beuken"]
  spec.email         = ["michael.beuken@ama.ab.ca"]
  spec.description   = %q{Logout before redirecting to authorized applications}
  spec.summary       = %q{Logout before redirection to OAuth consumer applications}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "doorkeeper", ">= 0.7.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
end