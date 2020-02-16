require 'application_system_test_case'

class LoginTest < ApplicationSystemTestCase

  def setup
    Rails.application.load_seed
    I18n.locale = locales(:de).name
  end

  #
  # Test signing in
  #

  test 'signing in with valid credentials leads to the overview page' do
    sign_in 'max.mustermann@example.com', 'geheim'

    assert_current_path overview_path
  end

  test 'signing in without credentials shows "Please fill out" popup' do
    sign_in nil, nil

    assert_current_path login_path
    assert_please_fill_out_popup_shown '#inputEmail'
  end

  test 'signing in without email shows "Please fill out" popup' do
    sign_in nil, 'geheim'

    assert_current_path login_path
    assert_please_fill_out_popup_shown '#inputEmail'
  end

  test 'signing in without password shows "Please fill out" popup' do
    sign_in 'max.mustermann@example.com', nil

    assert_current_path login_path
    assert_please_fill_out_popup_shown '#inputPassword'
  end

  test 'signing in with wrong email shows "Login failed" message' do
    sign_in 'max@example.com', 'geheim'

    assert_current_path login_path
    assert_suspicious_image_shown
  end

  test 'signing in with wrong password shows "Login failed" message' do
    sign_in 'max.mustermann@example.com', 'wrong'

    assert_current_path login_path
    assert_suspicious_image_shown
  end

  #
  # Test registration
  #

  test 'registering with valid credentials shows "Successful" message' do
    sign_up 'erika.mustermann@example.com', 'geheim'

    assert_current_path login_path
  end

  test 'registering without credentials shows "Please fill out" popup' do
    sign_up nil, nil

    assert_current_path login_path
    assert_please_fill_out_popup_shown '#inputEmailRegister'
  end

  test 'registering without email shows "Please fill out" popup' do
    sign_up nil, 'geheim'

    assert_current_path login_path
    assert_please_fill_out_popup_shown '#inputEmailRegister'
  end

  test 'registering without password shows "Please fill out" popup' do
    sign_up 'erika.mustermann@example.com', nil

    assert_current_path login_path
    assert_please_fill_out_popup_shown '#inputPasswordRegister'
  end

  test 'registering with existing email shows "Already existing" snackbar' do
    sign_up 'max.mustermann@example.com', 'foo'

    assert_current_path login_path
  end

  #
  # Helpers
  #

  private

  def sign_in email, password
    visit login_path
    fill_in(id: 'inputEmail', with: email) if email
    fill_in(id: 'inputPassword', with: password) if password
    click_on id: 'signIn'
  end

  def sign_up email, password
    visit login_path
    fill_in(id: 'inputEmailRegister', with: email) if email
    fill_in(id: 'inputPasswordRegister', with: password) if password
    click_on id: 'register'
  end

  ##
  # Assert that a "Please fill out" popup is shown next to the HTML input element.
  #
  def assert_please_fill_out_popup_shown html_input_element
    message = page.find(html_input_element).native.attribute 'validationMessage'
    assert_equal 'Please fill out this field.', message
  end

  ##
  # Assert that the "Login failed" snackbar at the bottom is shown.
  #
  def assert_login_failed_snackbar_shown
    assert_text :login_failed
  end

  ##
  # Assert that the "Account registration successfull!" snackbar at the bottom is shown.
  #
  def assert_sign_up_successful_snackbar_shown
    assert_text :account_registration_successfull
  end

  ##
  # Assert that the "Already existing" snackbar at the bottom is shown.
  #
  def assert_already_existing_snackbar_shown
    assert_text :account_creation_failed_exists
  end

  ##
  # Assert that the image with the suspicious looking guy is shwon instead of the MoneyManager icon.
  #
  def assert_suspicious_image_shown
    assert page.find('#avatar')['src'].include? 'suspicious'
  end

end
