ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  #
  #
  def assert_json_date(json_string, date_string)
    json_hash = JSON.parse json_string

    json_hash.each do |item|
      item.each do |key, value|
        if key == 'date'
          assert value.start_with? date_string
        end
      end
    end
  end


end
