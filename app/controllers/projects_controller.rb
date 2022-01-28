class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :require_project_manager, except: %i[index show]
  before_action :set_project, only: %i[edit update show destroy]

  def index
    @projects = Project.all.order(created_at: :desc)
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.project_manager_id = current_user.id
    if @project.save
      flash[:notice] = 'Project created successfully.'
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      flash[:info] = 'Project Was Updated Successfully!'
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = 'Project Was Deleted Successfully!'
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find_by_id(params[:id])
  end

  def require_project_manager
    return if current_user && current_user.role.identifier == 'project_manager'

    flash[:alert] = 'Only project managers can perform this action.'
    redirect_to dashboard_path
  end
end
