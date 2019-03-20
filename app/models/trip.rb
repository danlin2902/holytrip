class Trip < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :attachments, through: :tasks
  has_many :participants

  mount_uploader :photo, PhotoUploader
end
