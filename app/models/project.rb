class Project < ApplicationRecord
  belongs_to :project_manager, class_name: 'User', foreign_key: :project_manager_id

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }

  scope :recent_five_projects, -> { order(created_at: :desc).limit(5) }
  scope :sorted_projects, -> { order(created_at: :desc) }

  has_many :tickets, dependent: :destroy
  # scope :project_tickets_weekly, -> { tickets.where(created_at: (Date.today - 7.days)..Date.today) }
  def project_tickets_weekly
    tickets.where(created_at: (Date.today - 7.days)..Date.today)
    # tickets.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end
end
