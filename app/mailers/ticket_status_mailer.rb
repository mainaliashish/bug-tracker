class TicketStatusMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_status_mailer.send_bug_status.subject
  #
  def send_bug_status
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
