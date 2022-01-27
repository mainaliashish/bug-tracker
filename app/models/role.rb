class Role < ApplicationRecord
  has_many :users
  default_scope -> { where.not(name: 'Admin') }
end
