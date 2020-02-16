require 'test_helper'

class RelationsTest < ActiveSupport::TestCase

  setup do
    # noinspection RubyResolve
    @account = accounts(:one)
  end

  test 'access categories through accounts' do
    assert @account.categories
  end

  test 'access entries through accounts' do
    assert @account.entries
  end

  test 'access configuration' do
    assert @account.configuration
  end

end
