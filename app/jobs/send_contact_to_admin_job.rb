class SendContactToAdminJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 0

  def perform(contact_params)
    ContactMailer.contact_created(contact_params).deliver
  end
end
