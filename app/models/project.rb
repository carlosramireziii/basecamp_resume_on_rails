class Project < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :uploaded_files, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  def users
    User.all
  end
end
