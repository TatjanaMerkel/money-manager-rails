require "test_helper"

class LoginTest < ActionDispatch::IntegrationTest
  test "login with activation works" do
    register
    activate
    login
    get overview_path

    assert_response 200
  end

  private

  def register
    post register_path, params: {email: 'testemail@registration.test', password: 'testyeah'}
  end

  def activate
    account = Account.find_by_email 'testemail@registration.test'
    puts('####' + account.configuration.to_s)

    get "/app/activate/#{account.salt}"
  end

  def login
    post '/app/auth', params: {email: 'testemail@registration.test', password: 'testyeah'}
  end
end