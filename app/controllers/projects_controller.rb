class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  requires_registration except: [:index, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to [:projects]
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
      redirect_to [@project]
    else
      render :edit
    end
  end

  def destroy
    @project.destroy

    redirect_to [:projects]
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
