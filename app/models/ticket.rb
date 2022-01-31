class Ticket < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true

  belongs_to :project
  has_one :project_manager, through: :project

  # belongs_to :user
  # has_one :developer, through: :user

  enum priority: { high: 1, medium: 2, low: 3 }
  enum bug_type: { bug: 1, issue: 2, others: 3 }
  enum status: { fixed: 1, assigned: 2, active: 3 }
end
