module PagesHelper
  def switch_dashboard(id, role)
    @results = get_results(id, role)
  end

  def get_results(id, role)
    case role
    when 'user'
      @results = Ticket.where(user_id: id)
    when 'project_manager'
      @results = Project.where(project_manager_id: id)
    when 'developer'
      @results = Ticket.where(developer_id: id)
    end
  end
end
