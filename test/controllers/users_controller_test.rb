require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:carlos)
  end

  test 'should get new' do
    get new_users_path

    assert_response :success
    assert_select 'h1', text: 'Register'
    assert_select 'form'
  end

  test 'should post create' do
    assert_changes 'User.count' do
      post users_path, params: { user: new_user_params }
    end

    assert_response :redirect
    assert_redirected_to root_path
    assert_not_nil flash.notice
  end

  test 'should get edit' do
    sign_in @user
    get edit_users_path

    assert_response :success
    assert_select 'form'
  end

  test 'should patch update' do
    sign_in @user
    patch users_path, params: { user: { first_name: 'New Name' } }

    assert_response :redirect
    assert_redirected_to edit_users_path
    assert_equal 'New Name', @user.reload.first_name
  end

  private

  def new_user_params
    { email: 'new.user@test.com', password: 'mypass', first_name: 'New', last_name: 'User' }
  end
end
