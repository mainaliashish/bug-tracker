class TicketMailer < ApplicationMailer
  def ticket_created(ticket)
    @ticket = ticket
    @user = User.find_by_id(@ticket.user_id)
    @url = 'http://localhost:3000/users/sign_in'
    attachments['bug.png'] = File.read('app/assets/images/bug.png')

    mail from: 'Admin <admin@bug-tracker.com>',
         to: @ticket.project_manager.email,
         subject: "#{@user.full_name} has created a new Ticket in your project."
  end
end
