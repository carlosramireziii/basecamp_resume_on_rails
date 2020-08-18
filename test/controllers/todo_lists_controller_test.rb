require 'test_helper'

class TodoListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:my_project)
    @todo_list = todo_lists(:my_todo_list)
  end

  test 'should get index' do
    get project_todo_lists_path(@project)

    assert_response :success
    assert_select 'a', text: @project.title
    assert_select 'h1', text: 'To-dos'
    assert_select 'h2', text: @todo_list.title
  end

  test 'should get index when there are no todo lists' do
    TodoList.destroy_all

    get project_todo_lists_path(@project)

    assert_response :success
    assert_select 'a', text: 'Create a list now'
  end

  test 'should get new' do
    get new_project_todo_list_path(@project)

    assert_response :success
    assert_select 'h1', text: 'Create a new to-do list'
    assert_select 'form'
  end

  test 'should post create' do
    assert_changes 'TodoList.count' do
      sign_in users(:carlos)
      post project_todo_lists_path(@project), params: { todo_list: new_todo_list_params }
    end

    assert_response :redirect
    assert_redirected_to project_todo_lists_path(@project)
    assert_not_nil flash.notice
  end

  test 'should get show' do
    get project_todo_list_path(@project, @todo_list)

    assert_response :success
    assert_select 'h1', text: @todo_list.title
  end

  test 'should get edit' do
    get edit_project_todo_list_path(@project, @todo_list)

    assert_response :success
    assert_select 'h1', text: 'Update your to-do list'
    assert_select 'form'
  end

  test 'should patch update' do
    patch project_todo_list_path(@project, @todo_list), params: { todo_list: { title: 'New title' } }

    assert_response :redirect
    assert_redirected_to project_todo_list_path(@project, @todo_list)
    assert_not_nil flash.notice
    assert_equal 'New title', @todo_list.reload.title
  end

  test 'should delete destroy' do
    assert_changes 'TodoList.count' do
      delete project_todo_list_path(@project, @todo_list)
    end

    assert_response :redirect
    assert_redirected_to project_todo_lists_path
    assert_not_nil flash.alert
  end

  private

  def new_todo_list_params
    { title: 'My First To-do List' }
  end
end