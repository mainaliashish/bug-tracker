# Preview all emails at http://localhost:3000/rails/mailers/ticket_status_mailer
class TicketStatusMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ticket_status_mailer/send_bug_status
  def send_bug_status
    ticket_details = {
      tickets: Project.last.project_tickets_weekly,
      project: Project.last.name,
      email: User.all_project_manager.first.email
    }
    TicketStatusMailer.send_bug_status(ticket_details)
  end

end
