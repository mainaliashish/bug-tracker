class ContactMailer < ApplicationMailer
  def contact_created(contact)
    @url = ENV['SIGN_IN_URL']
    @contact = contact
    mail to: 'iamashishmainali@gmail.com',
         from: @contact.email,
         subject: "#{@contact.name} has messaaged you."
  end
end
