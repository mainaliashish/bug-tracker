class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_project, only: %i[edit update show destroy]
  before_action :set_ticket_params, only: :assign_ticket

  def index
    @pagy, @projects = pagy(Project.sorted_projects, items: 5)
  end

  def show; end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.project_manager_id = current_user.id
    authorize @project
    if @project.save
      flash[:notice] = 'Project created successfully.'
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
    authorize @project
  end

  def update
    authorize @project
    if @project.update(project_params)
      flash[:info] = 'Project Was Updated Successfully!'
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    authorize @project
    @project.destroy
    flash[:notice] = 'Project Was Deleted Successfully!'
    redirect_to projects_path
  end

  def assign_new
    @ticket = Ticket.find_by_id(params[:id])
    authorize @ticket
    render :assign_new
  end

  def assign_ticket
    @ticket = Ticket.find_by_id(params[:ticket][:id])
    authorize @ticket
    @ticket.update(set_ticket_params)
    flash[:notice] = 'Ticket assigned successfully.'
    redirect_to dashboard_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_ticket_params
    ticket_params = %i[developer_id priority status]
    params.require(:ticket).permit(ticket_params)
  end

  def set_project
    @project = Project.find_by_id(params[:id])
  end
end
