module Registration
  extend ActiveSupport::Concern

  module ClassMethods
    def requires_registration(options = {})
      before_action :require_registration, options
    end
  end

  private

  def require_registration
    if Current.user.guest?
      redirect_to new_users_path, notice: "You'll need to register first in order to do that"
    end
  end
end
