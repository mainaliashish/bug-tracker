class Project < ApplicationRecord
  belongs_to :users

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end
