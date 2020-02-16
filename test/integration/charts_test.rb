require "test_helper"

class ChartsTest < ActionDispatch::IntegrationTest

  setup do
    # 'fake' login to application to avoid 401 auth failed status
    post '/app/auth', params: {email: 'test@test.example', password: 'lalala'}
  end

  test "should get json file with entries of 2018" do
    get '/charts/2018'

    assert_not_equal response.status, 401
    assert_json_date(response.body, '2018')
  end

  test "should get json file with entries of january" do
    get '/charts/2018/01'

    assert_not_equal response.status, 401
    assert_json_date response.body, '2018-01'
  end

  test "should get json file with entries of 1st january" do
    get '/charts/2018/01/01'

    assert_not_equal response.status, 401
    assert_json_date response.body, '2018-01-01'
  end

  test "should get 404 status on invalid url" do
    get '/charts/no/valid/url'

    assert_not_equal response.status, 401
    assert_equal response.status, 404
  end
end