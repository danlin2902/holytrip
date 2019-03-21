class Task < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_many :attachments, dependent: :destroy
end
