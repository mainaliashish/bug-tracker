class Contact < ApplicationRecord
  before_save :handle_email
  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true

  def handle_email
    self.email = email.downcase
  end
end
