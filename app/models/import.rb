# frozen_string_literal: true

class Import < ApplicationRecord
  has_many :import_errors
  belongs_to :user

  validates :file_path, :status, presence: true

  enum status: %i[hold processing failed finished]
  # mount_uploader :file_path, AttachableUploader
end
