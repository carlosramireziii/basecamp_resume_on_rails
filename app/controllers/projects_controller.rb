class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to [:projects], notice: 'Enjoy your new project!'
    else
      render :new
    end
  end

  def show
    @messages = @project.messages.limit(4)
    @todo_lists = @project.todo_lists.limit(2)
    @uploaded_files = @project.uploaded_files.limit(4)
  end

  def edit
  end

  def update
    @project.attributes = project_params

    if @project.save
      redirect_to [@project], notice: 'Your project details have been updated!'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy

    redirect_to [:projects], alert: 'Your project has been permanently destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
