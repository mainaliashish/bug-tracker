class User < ApplicationRecord
  after_create :send_welcome_email
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

  scope :developers, -> { select(:id, :email).where(role_id: 2) }

  scope :total_developers, -> { where(role_id: 2).count }
  scope :project_managers, -> { where(role_id: 3).count }
  scope :normal_users, -> { where(role_id: 1).count }

  def self.all_project_manager
    User.where(role_id: 3)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def send_welcome_email
    UserMailer.user_created(self).deliver_later
  end

  def admin?
    role.identifier == 'admin'
  end

  def user?
    role.identifier == 'user'
  end

  def developer?
    role.identifier == 'developer'
  end

  def project_manager?
    role.identifier == 'project_manager'
  end
end
