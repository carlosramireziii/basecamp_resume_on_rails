module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private

  def sign_in(user)
    cookies.encrypted[:user_id] = user.id
  end

  def sign_out
    cookies.encrypted[:user_id] = nil
  end

  def authenticate
    if authenticated_user = User.find_by(id: cookies.encrypted[:user_id])
      Current.user = authenticated_user
    else
      Current.user = Guest.new
    end
  end
end
