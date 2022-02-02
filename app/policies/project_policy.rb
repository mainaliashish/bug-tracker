class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, project)
    super
    @user = user
    @project = project
  end

  def new?
    @user.role.identifier.eql? 'project_manager'
  end

  def create?
    new?
  end

  def edit?
    @project.project_manager_id == @user.id
  end

  def update?
    edit?
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
