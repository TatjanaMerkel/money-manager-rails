require 'application_system_test_case'

class NewEntryTest < ApplicationSystemTestCase

  def setup
    Rails.application.load_seed
    I18n.locale = locales(:de).name

    sign_in 'max.mustermann@example.com', 'geheim'

    click_button 'add'
  end

  #
  # Test navigation
  #

  test 'clicking the back icon leads to the overview page' do
    click_on 'back'

    assert_current_path overview_path
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

end
