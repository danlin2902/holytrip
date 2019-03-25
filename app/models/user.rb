class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :trips
  has_many :tasks
  has_many :attachments, through: :tasks
  has_many :participants
  after_create :send_welcome_email

  mount_uploader :photo, PhotoUploader

  private

  def send_welcome_email
    self.save
    UserMailer.welcome(self).deliver_later
  end
end
