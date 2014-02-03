ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
#require "minitest/pride"
#require 'pry-rescue/minitest'
require 'turn/autorun'

Turn.config do |c|
    c.format = :outline
    c.trace = "20"
    c.natural = true
    c.verbose = true
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end


