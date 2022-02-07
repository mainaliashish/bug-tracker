class TicketPolicy < ApplicationPolicy
  attr_reader :user, :ticket

  def initialize(user, ticket)
    super
    @user = user
    @ticket = ticket
  end

  def new?
    @user.user?
  end

  def create?
    new?
  end

  def edit?
    @ticket.user_id == @user.id
  end

  def update?
    edit?
  end

  def update_status?
    @ticket.developer_id == @user.id
  end

  def assign_new?
    @ticket.project.project_manager_id == @user.id
  end

  def assign_ticket?
    assign_new?
  end

  def destroy?
    edit?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
