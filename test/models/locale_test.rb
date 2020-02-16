require 'test_helper'

class LocaleTest < ActiveSupport::TestCase

  #
  # test validation of attribute presence
  #

  test 'should save locale with all parameters being set' do
    locale = Locale.new do |locale|
      locale.name = 'en'
    end

    assert locale.save
  end

  test 'should not save locale without name being set' do
    locale = Locale.new do |locale|
      # locale.name = 'en'
    end

    assert_not locale.save
  end

end
