class TodoItems::CompletionsController < ApplicationController
  include ProjectContext

  requires_registration

  before_action :set_todo_list, :set_todo_item

  def create
    @todo_item.complete!
    redirect_back fallback_location: [@project, @todo_list]
  end

  def destroy
    @todo_item.uncomplete!
    redirect_back fallback_location: [@project, @todo_list]
  end

  private

  def set_todo_list
    @todo_list = @project.todo_lists.find(params[:todo_list_id])
  end

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:todo_item_id])
  end
end
