require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
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
    get new_project_message_path(@project)

    assert_response :success
    assert_select 'h1', text: 'Write a new message'
    assert_select 'form'
  end

  test 'should post create' do
    assert_changes 'Message.count' do
      sign_in users(:carlos)
      post project_messages_path(@project), params: { message: new_message_params }
    end

    assert_response :redirect
    assert_redirected_to project_messages_path(@project)
    assert_not_nil flash.notice
  end

  test 'should get show' do
    get project_message_path(@project, @message)

    assert_response :success
    assert_select 'h1', text: @message.title
  end

  test 'should get edit' do
    get edit_project_message_path(@project, @message)

    assert_response :success
    assert_select 'h1', text: 'Update your message'
    assert_select 'form'
  end

  test 'should patch update' do
    patch project_message_path(@project, @message), params: { message: { title: 'New title' } }

    assert_response :redirect
    assert_redirected_to project_message_path(@project, @message)
    assert_not_nil flash.notice
    assert_equal 'New title', @message.reload.title
  end

  test 'should delete destroy' do
    assert_changes 'Message.count' do
      delete project_message_path(@project, @message)
    end

    assert_response :redirect
    assert_redirected_to project_messages_path
    assert_not_nil flash.alert
  end

  private

  def new_message_params
    { title: 'My First Message', content: '<p>My message content</p>' }
  end
end
