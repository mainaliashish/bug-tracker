class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role_id, presence: true
  belongs_to :role
  mount_uploader :profile_photo, ProfilePhotoUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
