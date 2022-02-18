class TicketStatusMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_status_mailer.send_bug_status.subject
  #
  def send_bug_status(ticket_details)
    @url = 'http://localhost:3000/users/sign_in'
    # puts ticket_details[:email]
    # puts ticket_details[:tickets].count
    @tickets = ticket_details[:tickets]
    # puts @tickets
    @project_name = ticket_details[:project]
    mail to: ticket_details[:email]
  end
end
