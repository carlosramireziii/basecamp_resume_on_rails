require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_sessions_path

    assert_response :success
    assert_select 'h1', text: 'Log In'
    assert_select 'input[type="email"]'
    assert_select 'input[type="password"]'
    assert_select 'input[type="submit"]'
  end

  test 'should post create with valid credentials' do
    carlos = users(:carlos)

    post sessions_path, params: { email: 'carlos.ramirez@test.com', password: 'mypass' }

    assert_response :redirect
    assert_redirected_to root_url
    assert_not_nil flash.notice
  end

  test 'should post create with invalid credentials' do
    post sessions_path, params: { email: 'carlos.ramirez@test.com', password: 'badpass' }

    assert_response :redirect
    assert_redirected_to new_sessions_path
    assert_not_nil flash.alert

    post sessions_path, params: { email: 'bad.email@test.com', password: 'mypass' }

    assert_response :redirect
    assert_redirected_to new_sessions_path
    assert_not_nil flash.alert
  end

  test 'should delete destroy' do
    delete sessions_path

    assert_response :redirect
    assert_redirected_to new_sessions_path
    assert_not_nil flash.alert
  end
end
