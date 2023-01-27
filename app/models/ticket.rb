class Ticket < ApplicationRecord
  # after_create :ticket_mail

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true

  belongs_to :project
  has_one :project_manager, through: :project

  enum priority: { high: 1, medium: 2, low: 3 }
  enum bug_type: { bug: 1, issue: 2, others: 3 }
  enum status: { fixed: 1, assigned: 2, active: 3, reviewing: 4 }

  scope :fixed_tickets, -> { where(status: 'fixed').count }
  scope :active_tickets, -> { where(status: nil).or(where.not(status: 'fixed')).count }
  scope :all_tickets, -> { count }
  scope :recent_five_fixed_tickets, -> { where(status: 'fixed').order(created_at: :desc).limit(5) }
  scope :recent_five_tickets, -> { where(status: nil).or(where.not(status: 'fixed')).limit(5) }

  def ticket_mail
    SendTicketCreated.set(wait: 5.minutes).perform_later(self)
  end
end
