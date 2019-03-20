class Trip < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :attachments, through: :tasks
  has_many :participants
  accepts_nested_attributes_for :participants
  mount_uploader :photo, PhotoUploader

  # geocoded_by :destination
  # after_validation :geocode, if: :will_save_change_to_address?
end
