require 'test_helper'

class TodoItems::CompletionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:carlos)
    @todo_item = todo_items(:my_todo_item)
  end

  test 'should post create' do
    @todo_item.uncomplete!

    sign_in @user
    post project_todo_list_todo_item_completions_path(@todo_item.project, @todo_item.todo_list, @todo_item)

    assert @todo_item.reload.complete?
  end

  test 'should not post create when signed out' do
    assert_requires_registration do
      post project_todo_list_todo_item_completions_path(@todo_item.project, @todo_item.todo_list, @todo_item)
    end
  end

  test 'should delete destroy' do
    @todo_item.complete!

    sign_in @user
    delete project_todo_list_todo_item_completions_path(@todo_item.project, @todo_item.todo_list, @todo_item)

    refute @todo_item.reload.complete?
  end

  test 'should not delete destroy when signed out' do
    assert_requires_registration do
      delete project_todo_list_todo_item_completions_path(@todo_item.project, @todo_item.todo_list, @todo_item)
    end
  end
end
