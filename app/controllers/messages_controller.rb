class MessagesController < ApplicationController
  include ProjectContext

  requires_registration except: [:index, :show]

  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = @project.messages
  end

  def new
    @message = @project.messages.new
  end

  def create
    @message = @project.messages.build(message_params_with_user)

    if @message.save
      redirect_to [@project, :messages], notice: 'Your message has been posted!'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @message.attributes = message_params

    if @message.save
      redirect_to [@project, @message], notice: 'Your message has been updated!'
    else
      render :edit
    end
  end

  def destroy
    @message.destroy

    redirect_to [@project, :messages], alert: 'Your message has been destroyed'
  end

  private

  def set_message
    @message = @project.messages.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :content)
  end

  def message_params_with_user
    message_params.merge(user: Current.user)
  end
end
