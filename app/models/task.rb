class Task < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_many :attachments, dependent: :destroy

  def self.find_incomplete(trip)
    helper = Task.where(trip_id: trip.id, done_at: nil)
    return helper
  end

  def self.find_complete(trip)
    helper = Task.where(trip_id: trip.id).where.not(done_at: nil)
    return helper
  end
end
