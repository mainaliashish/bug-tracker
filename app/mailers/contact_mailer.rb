class ContactMailer < ApplicationMailer
  def contact_created(contact)
    @url = 'http://localhost:3000/users/sign_in'
    @contact = contact
    mail to: 'iamshishmainali@gmail.com',
         from: @contact.email,
         subject: "#{@contact.name} has messaaged you."
  end
end
