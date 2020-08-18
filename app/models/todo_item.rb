class TodoItem < ApplicationRecord
  belongs_to :todo_list
  belongs_to :user

  delegate :project, to: :todo_list

  scope :complete, -> { where(complete: true) }
  scope :incomplete, -> { where(complete: false) }

  def complete!
    update!(complete: true)
  end

  def uncomplete!
    update!(complete: false)
  end
end
