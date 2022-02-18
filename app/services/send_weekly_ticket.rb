class SendWeeklyTicket
  def initialize(users)
    @users = users
  end

  def mail_project_managers
    @users.each do |user|
      next unless user.projects.count.positive?

      ticket_details(user)
    end
  end

  private

  def ticket_details(user)
    user.projects.each do |project|
      next unless project.project_tickets_weekly.exists?

      ticket_details = {
        tickets: project.project_tickets_weekly,
        project: project.name,
        email: user.email
      }
      TicketStatusMailer.send_bug_status(ticket_details).deliver_now
    end
  end
end
