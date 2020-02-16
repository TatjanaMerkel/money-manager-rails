require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  #
  # test methods
  #

  test 'sum_all_entries() should sum up all entries' do
    category = categories(:one)

    sum = category.sum_all_entries

    assert_equal -1700, sum
  end

  test 'svg_icon() should append dimensional properties' do
    category = Category.new do |category|
      category.name = 'income'
      category.color = '#303f9f'
      category.icon = 'baseline-build-24px.svg'
      category.incomeExpense = 0

      category.configuration = configurations(:one)
    end

    actual_result = category.svg_icon
    expected_result = <<~TEXT.chomp
      <svg xmlns="http://www.w3.org/2000/svg" width="40px" height="40px" viewBox="0 0 24 24" style="fill: #303f9f">
          <path clip-rule="evenodd" fill="none" d="M0 0h24v24H0z"/>
          <path d="M22.7 19l-9.1-9.1c.9-2.3.4-5-1.5-6.9-2-2-5-2.4-7.4-1.3L9 6 6 9 1.6 4.7C.4 7.1.9 10.1 2.9 12.1c1.9 1.9 4.6 2.4 6.9 1.5l9.1 9.1c.4.4 1 .4 1.4 0l2.3-2.3c.5-.4.5-1.1.1-1.4z"/>
      </svg>
    TEXT

    assert_equal expected_result, actual_result
  end

  #
  # test validation of attribute presence
  #

  test 'should save category with all parameters being set' do
    category = Category.new do |category|
      category.name = 'income'
      category.color = '#303f9f'
      category.icon = 'baseline-euro_symbol-24px.svg'
      category.incomeExpense = 0

      category.configuration = configurations(:one)
    end

    assert category.save
  end

  test 'should not save category without name being set' do
    category = Category.new do |category|
      # category.name = 'income'
      category.color = '#303f9f'
      category.icon = 'baseline-euro_symbol-24px.svg'
      category.incomeExpense = 0

      category.configuration = configurations(:one)
    end

    assert_not category.save
  end

  test 'should not save category without color being set' do
    category = Category.new do |category|
      category.name = 'income'
      # category.color = '#303f9f'
      category.icon = 'baseline-euro_symbol-24px.svg'
      category.incomeExpense = 0

      category.configuration = configurations(:one)
    end

    assert_not category.save
  end

  test 'should not save category without icon being set' do
    category = Category.new do |category|
      category.name = 'income'
      category.color = '#303f9f'
      # category.icon = 'baseline-euro_symbol-24px.svg'
      category.incomeExpense = 0

      category.configuration = configurations(:one)
    end

    assert_not category.save
  end

  test 'should not save category without incomeExpense being set' do
    category = Category.new do |category|
      category.name = 'income'
      category.color = '#303f9f'
      category.icon = 'baseline-euro_symbol-24px.svg'
      # category.incomeExpense = 0

      category.configuration = configurations(:one)
    end

    assert_not category.save
  end

  test 'should not save category without configuration being set' do
    category = Category.new do |category|
      category.name = 'income'
      category.color = '#303f9f'
      category.icon = 'baseline-euro_symbol-24px.svg'
      category.incomeExpense = 0

      # category.configuration = configurations(:one)
    end

    assert_not category.save
  end

end
