class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[homepage]

  def homepage
    @projects = Project.all
  end

  def dashboard
    id = current_user.id
    @projects = Project.all
    @tickets = Ticket.where(id: id)
  end
end
