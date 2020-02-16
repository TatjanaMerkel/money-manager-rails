require "test_helper"

class LoginTest < ActionDispatch::IntegrationTest

  test "Login works (Redirect before login, Success after login)" do
    get '/app/overview'
    assert_response :redirect

    post '/app/auth', params: {email: 'test@test.example', password: 'lalala'}

    get '/app/overview'
    assert_response :success
  end

  test "Login fails with wrong credentials" do
    post '/app/auth', params: {email: 'wrong@wrong.com', password: 'wrong'}

    get '/app/overview'
    assert_response :redirect

  end

  test "All secured routes redirect to login page when not logged in" do

    routes = Rails.application.routes.routes

    routes.each do |route|
      r =  route.path.to_s

      if r.start_with? '/app' || r.start_with?('/charts') && r != '/app/login'
        puts r
        get r

        assert_response :redirect

        assert_redirected_to '/app/login'

      end
    end

  end

  test "Logout works" do
    get '/app/overview'
    assert_response :redirect

    post '/app/auth', params: {email: 'test@test.example', password: 'lalala'}

    get '/app/overview'
    assert_response :success

    get '/app/logout'

    get '/app/overview'
    assert_response :redirect
  end

end