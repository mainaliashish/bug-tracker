class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[homepage]

  def homepage
    @projects = Project.all
    @tickets = Ticket.all
  end

  def dashboard
    id = current_user.id
    role = current_user.role.identifier
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
