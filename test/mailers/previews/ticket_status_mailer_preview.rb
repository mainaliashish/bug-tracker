# Preview all emails at http://localhost:3000/rails/mailers/ticket_status_mailer
class TicketStatusMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ticket_status_mailer/send_bug_status
  def send_bug_status
    TicketStatusMailer.send_bug_status
  end

end
