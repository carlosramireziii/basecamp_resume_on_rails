class User < ApplicationRecord
  has_secure_password

  has_one_attached :avatar

  def full_name
    [first_name, last_name].reject(&:blank?).compact.join(' ')
  end

  def guest?
    false
  end
end
