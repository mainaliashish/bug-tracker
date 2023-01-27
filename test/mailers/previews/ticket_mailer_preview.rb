# Preview all emails at http://localhost:3000/rails/mailers/ticket_mailer
class TicketMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ticket_mailer/ticket_created
  def ticket_created
    ticket = Ticket.last
    TicketMailer.ticket_created(ticket)
  end

end
