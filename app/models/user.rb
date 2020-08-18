class User < ApplicationRecord
  has_secure_password

  def full_name
    [first_name, last_name].reject(&:blank?).compact.join(' ')
  end
end
