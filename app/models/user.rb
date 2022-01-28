class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role_id, presence: true
  belongs_to :role
  has_many :projects, class_name: 'Project', foreign_key: :project_manager_id
  has_many :tickets, class_name: 'Ticket', foreign_key: :ticket_id

  mount_uploader :profile_photo, ProfilePhotoUploader

  scope :developers, -> { select(:id, :email).where(role_id: 3) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
