class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[homepage]

  def homepage
    @projects = Project.all
  end

  def dashboard
    @projects = Project.all
    @tickets = Ticket.all
  end
end
