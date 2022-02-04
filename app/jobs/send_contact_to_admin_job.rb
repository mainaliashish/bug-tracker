class SendContactToAdminJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 0

  def perform(contact)
    ContactMailer.contact_created(contact).deliver_later
  end
end
