require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase

  #
  # test validation of attribute presence
  #

  test 'should save currency with all parameters being set' do
    currency = Currency.new do |currency|
      currency.name = 'USD'
      currency.symbol = '$'
    end

    assert currency.save
  end

  test 'should not save currency without name being set' do
    currency = Currency.new do |currency|
      # currency.name = 'USD'
      currency.symbol = '$'
    end

    assert_not currency.save
  end

  test 'should not save currency without symbol being set' do
    currency = Currency.new do |currency|
      currency.name = 'USD'
      # currency.symbol = '$'
    end

    assert_not currency.save
  end

end
