require 'test_helper'

class TodoItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:my_project)
    @todo_list = todo_lists(:my_todo_list)
    @todo_item = todo_items(:my_todo_item)
  end

  test 'should get new' do
    get new_project_todo_list_todo_item_path(@project, @todo_list), xhr: true

    assert_response :success
  end

  test 'should post create' do
    assert_changes 'TodoItem.count' do
      sign_in users(:carlos)
      post project_todo_list_todo_items_path(@project, @todo_list), xhr: true, params: { todo_item: new_todo_item_params }
    end

    assert_response :success
  end

  test 'should delete destroy' do
    assert_changes 'TodoItem.count' do
      sign_in users(:carlos)
      delete project_todo_list_todo_item_path(@project, @todo_list, @todo_item)
    end

    assert_response :redirect
  end

  private

  def new_todo_item_params
    { title: 'My new to-do' }
  end
end
