require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  #
  # test methods
  #

  test 'all_from_year() should return all entries for that year, prepared for Google charts' do
    account = accounts(:one)

    actual_result = account.all_from_year 2018
    expected_result = [entries(:three), entries(:two), entries(:one)]

    assert_equal expected_result, actual_result.to_a
  end

  test 'all_from_month() should return all entries for that month, prepared for Google charts' do
    account = accounts(:one)

    actual_result = account.all_from_month 2018, 2
    expected_result = [entries(:three), entries(:one)]

    assert_equal expected_result, actual_result.to_a
  end

  test 'all_from_day() should return all entries for that day, prepared for Google charts' do
    account = accounts(:one)

    actual_result = account.all_from_day 2018, 10, 10
    expected_result = [entries(:two)]

    assert_equal expected_result, actual_result.to_a
  end

  test 'expenses() should return all entries that are expenses for this month' do
    account = accounts(:one)

    actual_result = account.expenses
    expected_result = -1500

    assert_equal expected_result, actual_result
  end

  #
  # test validation of attribute presence
  #

  test 'should save account with all parameters being set' do
    account = Account.new do |account|
      account.email = 'max.mustermann@example.com'
      account.password = '12345678'
      account.salt = 'foo'
      account.activated = true
    end

    assert account.save
  end

  test 'should save account with required parameters being set' do
    account = Account.new do |account|
      account.email = 'max.mustermann@example.com'
      account.password = '12345678'
      # account.salt = 'foo'
      # account.activated = true
    end

    assert account.save
  end

  test 'should not save account without email being set' do
    account = Account.new do |account|
      # account.email = 'max.mustermann@example.com'
      account.password = '12345678'
    end

    assert_not account.save
  end

  test 'should not save account without password being set' do
    account = Account.new do |account|
      account.email = 'max.mustermann@example.com'
      # account.password = '12345678'
    end

    assert_not account.save
  end

end
