class UploadedFilesController < ApplicationController
  include ProjectContext

  requires_registration except: [:index, :show]

  before_action :set_uploaded_file, only: [:show, :destroy]

  def index
    @uploaded_files = @project.uploaded_files
  end

  def new
    @uploaded_file = @project.uploaded_files.new
  end

  def create
    @uploaded_file = @project.uploaded_files.build(uploaded_file_params_with_user)

    if @uploaded_file.save
      redirect_to [@project, :uploaded_files], notice: 'Your file has been uploaded!'
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @uploaded_file.destroy

    redirect_to [@project, :uploaded_files], alert: 'Your file has been destroyed'
  end

  private

  def set_uploaded_file
    @uploaded_file = @project.uploaded_files.find(params[:id])
  end

  def uploaded_file_params
    params.require(:uploaded_file).permit(:file)
  end

  def uploaded_file_params_with_user
    uploaded_file_params.merge(user: Current.user)
  end
end
