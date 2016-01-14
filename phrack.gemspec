# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "phrack/version"

Gem::Specification.new do |s|
  s.name        = "phrack"
  s.version     = Phrack::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Edit phrases inline for Rails applications!"
  s.email       = "contact@infinum.co"
  s.homepage    = "http://github.com/infinum/phrack"
  s.description = "Phrack!"
  s.authors     = ['Tomislav Car', 'Damir Svrtan']
  s.license     = "MIT"

  s.files = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency "rails", ">= 3.2.0"
  s.add_dependency "railties", ">= 3.2"
  s.add_dependency "haml"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-cookie-rails"
  s.add_dependency "sass"
  s.add_dependency 'factory_girl_rails'
  s.add_dependency 'sqlite3'
  s.add_dependency 'rspec-rails'
  s.add_dependency 'capybara', '~> 2.2.0'
  s.add_dependency 'jasmine-rails'
  s.add_dependency 'ckeditor'
  s.add_dependency 'carrierwave'
  s.add_dependency 'mini_magick'

  s.add_development_dependency 'pry'

end
