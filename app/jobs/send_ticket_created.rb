class SendTicketCreated < ApplicationJob
  queue_as :default
  sidekiq_options retry: 0

  def perform(_contact)
    TicketMailer.ticket_created(ticket).deliver_later
  end
end
