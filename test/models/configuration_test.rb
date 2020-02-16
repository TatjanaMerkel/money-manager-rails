require 'test_helper'

class ConfigurationTest < ActiveSupport::TestCase

  #
  # test validation of attribute presence
  #

  test 'should save configuration with all parameters being set' do
    configuration = Configuration.new do |configuration|
      configuration.avatar = 'max.jpg'

      configuration.account = accounts(:one)
      configuration.locale = locales(:de)
    end

    assert configuration.save
  end

  test 'should not save configuration without avatar being set' do
    configuration = Configuration.new do |configuration|
      # configuration.avatar = 'max.jpg'

      configuration.account = accounts(:one)
      configuration.locale = locales(:de)
    end

    assert_not configuration.save
  end

  test 'should not save configuration without account being set' do
    configuration = Configuration.new do |configuration|
      configuration.avatar = 'max.jpg'

      # configuration.account = accounts(:one)
      configuration.locale = locales(:de)
    end

    assert_not configuration.save
  end

  test 'should not save configuration without locale being set' do
    configuration = Configuration.new do |configuration|
      configuration.avatar = 'max.jpg'

      configuration.account = accounts(:one)
      # configuration.locale = locales(:de)
    end

    assert_not configuration.save
  end

end
