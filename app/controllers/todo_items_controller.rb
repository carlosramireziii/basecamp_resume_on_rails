class TodoItemsController < ApplicationController
  include ProjectContext
  
  before_action :set_todo_list

  def new
    @todo_item = @todo_list.todo_items.new
  end

 def create
    @todo_item = @todo_list.todo_items.build(todo_item_params_with_user)
    @todo_item.save
  end

  private

  def set_todo_list
    @todo_list = @project.todo_lists.find(params[:todo_list_id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:title)
  end

  def todo_item_params_with_user
    todo_item_params.merge(user: Current.user)
  end
end
