class TodoListsController < ApplicationController
  include ProjectContext

  requires_registration except: [:index, :show]

  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def index
    @todo_lists = @project.todo_lists
  end

  def new
    @todo_list = @project.todo_lists.new
  end

  def create
    @todo_list = @project.todo_lists.build(todo_list_params_with_user)

    if @todo_list.save
      redirect_to [@project, :todo_lists], notice: 'Your to-do list has been created!'
    else
      render :new
    end
  end

  def show
    @todo_items = @todo_list.todo_items.order_by_incomplete_first
  end

  def edit
  end

  def update
    @todo_list.attributes = todo_list_params

    if @todo_list.save
      redirect_to [@project, @todo_list], notice: 'Your to-do list has been updated!'
    else
      render :edit
    end
  end

  def destroy
    @todo_list.destroy

    redirect_to [@project, :todo_lists], alert: 'Your to-do list and all its to-do items have been destroyed'
  end

  private

  def set_todo_list
    @todo_list = @project.todo_lists.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit(:title, :content)
  end

  def todo_list_params_with_user
    todo_list_params.merge(user: Current.user)
  end
end
