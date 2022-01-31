class Project < ApplicationRecord
  belongs_to :project_manager, class_name: 'User', foreign_key: :project_manager_id

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }

  has_many :tickets
end
