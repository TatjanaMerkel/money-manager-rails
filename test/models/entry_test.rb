require 'test_helper'

class EntryTest < ActiveSupport::TestCase

  #
  # test validation of attribute presence
  #

  test 'should save entry with all parameters being set' do
    entry = Entry.new do |entry|
      entry.title = 'August wage'
      entry.amount = 2800
      entry.date = Date.new 2018, 8, 30
      entry.photo = 'money.jpg'

      entry.category = categories(:one)
      entry.currency = currencies(:euro)
    end

    assert entry.save
  end

  test 'should save entry with required parameters being set' do
    entry = Entry.new do |entry|
      entry.title = 'August wage'
      entry.amount = 2800
      entry.date = Date.new 2018, 8, 30
      # entry.photo = 'money.jpg'

      entry.category = categories(:one)
      entry.currency = currencies(:euro)
    end

    assert entry.save
  end

  test 'should not save entry without title being set' do
    entry = Entry.new do |entry|
      # entry.title = 'August wage'
      entry.amount = 2800
      entry.date = Date.new 2018, 8, 30

      entry.category = categories(:one)
      entry.currency = currencies(:euro)
    end

    assert_not entry.save
  end

  test 'should not save entry without amount being set' do
    entry = Entry.new do |entry|
      entry.title = 'August wage'
      # entry.amount = 2800
      entry.date = Date.new 2018, 8, 30

      entry.category = categories(:one)
      entry.currency = currencies(:euro)
    end

    assert_not entry.save
  end

  test 'should not save entry without date being set' do
    entry = Entry.new do |entry|
      entry.title = 'August wage'
      entry.amount = 2800
      # entry.date = Date.new 2018, 8, 30

      entry.category = categories(:one)
      entry.currency = currencies(:euro)
    end

    assert_not entry.save
  end

  test 'should not save entry without category being set' do
    entry = Entry.new do |entry|
      entry.title = 'August wage'
      entry.amount = 2800
      entry.date = Date.new 2018, 8, 30

      # entry.category = categories(:one)
      entry.currency = currencies(:euro)
    end

    assert_not entry.save
  end

  test 'should not save entry without currency being set' do
    entry = Entry.new do |entry|
      entry.title = 'August wage'
      entry.amount = 2800
      entry.date = Date.new 2018, 8, 30

      entry.category = categories(:one)
      # entry.currency = currencies(:euro)
    end

    assert_not entry.save
  end

  #
  #
  #

  setup do
    # noinspection RubyResolve
    @account = accounts(:one)
  end

  test 'New entry can be created' do
    e = new_entry

    assert e.save

    id = e.id

    last_entry = @account.entries.last

    assert_equal id, last_entry.id

  end

  test 'New Entry is not accessible from other accounts' do
    e = new_entry

    assert e.save

    other_account = accounts(:two)

    assert_raises ActiveRecord::RecordNotFound do
      other_account.entries.find(e.id)
    end
  end

  test 'Entry can be edited' do
    e = new_entry

    assert e.save

    e.amount = -200

    e.title = 'New title'

    assert e.save
  end

  private

  def new_entry
    Entry.new do |e|
      e.title = 'New entry'
      e.amount = 30
      e.date = Date.new 2018, 8, 30
      e.category = @account.categories.first
      e.currency = Currency.first
    end
  end

end
