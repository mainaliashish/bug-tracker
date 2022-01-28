class Ticket < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, lenght: { in: 10..100 }

  belongs_to :project
  has_one :project_manager, through: :project
end
