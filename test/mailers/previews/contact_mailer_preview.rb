# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/contact_created
  def contact_created
    contact = Contact.last
    ContactMailer.contact_created(contact)
  end

end
