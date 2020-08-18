class UploadedFile < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_one_attached :file

  delegate :filename, :content_type, :byte_size, to: :file, allow_nil: true
end
