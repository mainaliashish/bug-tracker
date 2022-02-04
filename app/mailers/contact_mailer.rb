class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_created.subject
  #
  def contact_created
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
