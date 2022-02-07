class Project < ApplicationRecord
  belongs_to :project_manager, class_name: 'User', foreign_key: :project_manager_id

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }

  has_many :tickets

  def project_tickets_weekly
    tickets.where(created_at: (Date.today - 7.days)..Date.today)
  end
end
