require 'test_helper'

class TodoItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:carlos)
    @project = projects(:my_project)
    @todo_list = todo_lists(:my_todo_list)
    @todo_item = todo_items(:my_todo_item)
  end

  test 'should get new' do
    sign_in @user
    get new_project_todo_list_todo_item_path(@project, @todo_list), xhr: true

    assert_response :success
  end

  test 'should not get new when signed out' do
    assert_requires_registration do
      get new_project_todo_list_todo_item_path(@project, @todo_list), xhr: true
    end
  end

  test 'should post create' do
    assert_changes 'TodoItem.count' do
      sign_in @user
      post project_todo_list_todo_items_path(@project, @todo_list), xhr: true, params: { todo_item: new_todo_item_params }
    end

    assert_response :success
  end

  test 'should not post create when signed out' do
    assert_requires_registration do
      post project_todo_list_todo_items_path(@project, @todo_list)
    end
  end

  test 'should delete destroy' do
    assert_changes 'TodoItem.count' do
      sign_in @user
      delete project_todo_list_todo_item_path(@project, @todo_list, @todo_item)
    end

    assert_response :redirect
  end

  test 'should not delete destroy when signed out' do
    assert_requires_registration do
      delete project_todo_list_todo_item_path(@project, @todo_list, @todo_item)
    end
  end


  private

  def new_todo_item_params
    { title: 'My new to-do' }
  end
end
