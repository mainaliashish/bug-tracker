class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[homepage]

  def homepage
    @projects = Project.order(created_at: :desc)
    @tickets = Ticket.where.not(status: 'fixed').order(created_at: :desc)
    @fixed_tickets = Ticket.where(status: 'fixed').order(created_at: :desc)
  end

  def dashboard
    id = current_user.id
    role = current_user.role.identifier
    results = helpers.switch_dashboard(id, role)
    results.include?(:tickets) ? @tickets = results : @projects = results
  end
end
