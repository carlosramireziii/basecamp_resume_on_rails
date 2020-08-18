require 'test_helper'

class TodoItemTest < ActiveSupport::TestCase
  setup do
    @todo_item = todo_items(:my_todo_item)
  end

  test 'should complete the todo' do
    @todo_item.update(complete: false)
    @todo_item.complete!
    assert @todo_item.reload.complete?
  end

  test 'should uncomplete the todo' do
    @todo_item.update(complete: true)
    @todo_item.uncomplete!
    refute @todo_item.reload.complete?
  end
end
