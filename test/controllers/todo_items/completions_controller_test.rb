require 'test_helper'

class TodoItems::CompletionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo_item = todo_items(:my_todo_item)
  end

  test 'should post create' do
    @todo_item.uncomplete!

    post project_todo_list_todo_item_completions_path(@todo_item.project, @todo_item.todo_list, @todo_item)

    assert @todo_item.reload.complete?
  end

  test 'should delete destroy' do
    @todo_item.complete!

    delete project_todo_list_todo_item_completions_path(@todo_item.project, @todo_item.todo_list, @todo_item)

    refute @todo_item.reload.complete?
  end
end
