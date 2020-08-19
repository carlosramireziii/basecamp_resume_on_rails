require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:carlos)
    @project = projects(:my_project)
    @message = messages(:my_message)
  end

  test 'should get index' do
    get project_messages_path(@project)

    assert_response :success
    assert_select 'a', text: @project.title
    assert_select 'h1', text: 'Message Board'
    assert_select 'h2', text: @message.title
  end

  test 'should get index when there are no messages' do
    Message.delete_all

    get project_messages_path(@project)

    assert_response :success
    assert_select 'a', text: 'Write a message now'
  end

  test 'should get new' do
    sign_in @user
    get new_project_message_path(@project)

    assert_response :success
    assert_select 'h1', text: 'Write a new message'
    assert_select 'form'
  end

  test 'should not get new when signed out' do
    assert_requires_registration do
      get new_project_message_path(@project)
    end
  end

  test 'should post create' do
    assert_changes 'Message.count' do
      sign_in @user
      post project_messages_path(@project), params: { message: new_message_params }
    end

    assert_response :redirect
    assert_redirected_to project_messages_path(@project)
  end

  test 'should not post create when signed out' do
    assert_requires_registration do
      post project_messages_path(@project)
    end
  end

  test 'should get show' do
    get project_message_path(@project, @message)

    assert_response :success
    assert_select 'h1', text: @message.title
  end

  test 'should get edit' do
    sign_in @user
    get edit_project_message_path(@project, @message)

    assert_response :success
    assert_select 'h1', text: 'Update your message'
    assert_select 'form'
  end

  test 'should not get edit when signed out' do
    assert_requires_registration do
      get edit_project_message_path(@project, @message)
    end
  end

  test 'should patch update' do
    sign_in @user
    patch project_message_path(@project, @message), params: { message: { title: 'New title' } }

    assert_response :redirect
    assert_redirected_to project_message_path(@project, @message)
    assert_equal 'New title', @message.reload.title
  end

  test 'should not patch update when signed out' do
    assert_requires_registration do
      patch project_message_path(@project, @message)
    end
  end

  test 'should delete destroy' do
    assert_changes 'Message.count' do
      sign_in @user
      delete project_message_path(@project, @message)
    end

    assert_response :redirect
    assert_redirected_to project_messages_path
  end

  test 'should not delete destroy when signed out' do
    assert_requires_registration do
      delete project_message_path(@project, @message)
    end
  end

  private

  def new_message_params
    { title: 'My First Message', content: '<p>My message content</p>' }
  end
end
