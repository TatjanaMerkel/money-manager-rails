require 'application_system_test_case'

class OverviewTest < ApplicationSystemTestCase

  def setup
    Rails.application.load_seed
    I18n.locale = locales(:de).name

    sign_in 'max.mustermann@example.com', 'geheim'
  end

  #
  # Test navigation
  #

  test 'clicking the settings icon leads to the settings page' do
    click_on 'settings'

    assert_current_path settings_path
  end

  test 'clicking the categories link in the drawer leads to the categories page' do
    click_on 'menu'
    click_on I18n.t :categories

    assert_current_path categories_path
  end

  test 'clicking the statistics link in the drawer leads to the statistics page' do
    click_on 'menu'
    click_on I18n.t :statistics

    assert_current_path statistics_path
  end

  test 'clicking the logout link in the drawer leads to the login page' do
    click_on 'menu'
    click_on I18n.t :sign_out

    assert_current_path login_path
  end

  test 'clicking the "All Entries" button leads to the "All Entries" page' do
    click_on I18n.t :all_entries

    assert_current_path entries_overview_path
  end

  test 'clicking the "Add" button leads to the "New Entry" page' do
    click_button 'add'

    assert_current_path new_entry_path
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
