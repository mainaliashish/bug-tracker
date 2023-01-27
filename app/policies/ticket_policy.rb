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
    @user.admin? || @ticket.user_id == @user.id
  end

  def update?
    edit?
  end

  def update_status?
    @user.admin? || @ticket.developer_id == @user.id
  end

  def assign_new?
    @user.admin? || @ticket.project.project_manager_id == @user.id
  end

  def assign_ticket?
    assign_new?
  end

  def update_ticket_status?
    update_status?
  end

  def destroy?
    edit?
  end

  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
end
