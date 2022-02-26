# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "bookingsync/version"

Gem::Specification.new do |s|
  s.name = "bookingsync"
  s.version = BookingSync::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.authors = "Sebastien Grosjean"
  s.email = "public@zencocoon.com"
  s.homepage = "http://github.com/BookingSync/bookingsync-ruby"
  s.summary = "Ruby wrapper around BookingSync API. Version #{BookingSync::Version::STRING}"
  s.description = %q{  Ruby wrapper around BookingSync API

  Configure by adding the following:

  require 'bookingsync'
  BookingSync::Base.user = 'your_api_auth_token'
}
  s.files = `git ls-files -- lib/*`.split("\n")
  s.test_files = `git ls-files -- {spec,features}/*`.split("\n")
  s.extra_rdoc_files = "README.md"
  s.rdoc_options = "--charset=UTF-8"
  s.require_path = "lib"

  s.add_runtime_dependency 'activeresource', '>= 3.0'

  s.add_development_dependency "rake", "~> 0.9"
  s.add_development_dependency "cucumber", "1.0.0"
  s.add_development_dependency "aruba", "0.4.2"
  s.add_development_dependency "nokogiri", "1.13.3"
  s.add_development_dependency "relish", "0.4.0"
  s.add_development_dependency 'yard', "~> 0.7.2"
  s.add_development_dependency 'rspec', '~> 2.8.0'
  s.add_development_dependency "guard-rspec", "0.1.9"
  s.add_development_dependency 'guard-cucumber', "~> 0.5.1"
  s.add_development_dependency "growl", "1.0.3"
  s.add_development_dependency "appraisal", '~> 0.3.8'
end
