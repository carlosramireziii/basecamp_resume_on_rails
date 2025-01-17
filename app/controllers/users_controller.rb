class UsersController < ApplicationController
  before_action :set_current_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.attributes = user_params

    if @user.save
      redirect_to [:edit, :users], notice: 'Your profile changes have been saved'
    else
      render :edit
    end
  end

  private

  def set_current_user
    @user = Current.user
  end

  def user_params
    params.require(:user).permit(:avatar, :email, :first_name, :last_name, :password)
  end
end
