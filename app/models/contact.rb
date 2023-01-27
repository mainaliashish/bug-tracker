class Contact < ApplicationRecord
  before_save :handle_email
  after_create :send_mail_admin
  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true

  def handle_email
    self.email = email.downcase
  end

  def send_mail_admin
    SendContactToAdminJob.set(wait: 2.minutes).perform_later(self)
  end
end
