class SessionsController < ApplicationController
  before_action :set_user, only: [:create]

  def new
  end

  def create
    if @user && @user.authenticate(password_param)
      sign_in @user
      redirect_to [:root]
    else
      redirect_to [:new, :sessions], alert: "Hmm that didn't work. Could you try again please"
    end
  end

  def destroy
    sign_out
    redirect_to [:new, :sessions]
  end

  private

  def set_user
    @user = User.find_by(email: email_param)
  end

  def email_param
    params.require(:email)
  end

  def password_param
    params.require(:password)
  end
end
