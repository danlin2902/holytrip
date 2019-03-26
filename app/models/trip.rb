class Trip < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :attachments, through: :tasks, dependent: :destroy
  has_many :participants, dependent: :destroy
  accepts_nested_attributes_for :participants
  mount_uploader :photo, PhotoUploader

  # geocoded_by :destination
  # after_validation :geocode, if: :will_save_change_to_address?

  after_create :assign_self_as_participant

  validates :name, presence: true
  validates :destination, presence: true

  private

  def assign_self_as_participant
    owner = Participant.new(email: self.user.email, trip: self, status: "joined")
    owner.user = self.user
    owner.save
  end
end

