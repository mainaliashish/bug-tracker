class Ticket < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true

  belongs_to :project
  has_one :project_manager, through: :project

  enum priority: { high: 1, medium: 2, low: 3 }
  enum bug_type: { bug: 1, issue: 2, others: 3 }
  enum status: { fixed: 1, assigned: 2, active: 3, reviewing: 4 }
end
