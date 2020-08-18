class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  def users
    User.all
  end
end
