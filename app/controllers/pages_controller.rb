class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[homepage]

  def homepage
    @projects = Project.all
    @tickets = Ticket.all
  end

  def dashboard
    id = current_user.id
    @projects = Project.where(project_manager_id: id)
    @tickets = Ticket.where(id: id)
  end
end
