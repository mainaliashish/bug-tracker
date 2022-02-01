module PagesHelper
  def switch_dashboard(id, role)
    case role
    when 'user'
      @tickets = Ticket.where(user_id: id)
    when 'project_manager'
      @projects = Project.where(project_manager_id: id)
    when 'developer'
      @tickets = Ticket.where(developer_id: id)
    end
  end
end
