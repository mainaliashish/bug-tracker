class TicketsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_ticket, only: %i[edit update update_status show destroy]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    authorize @ticket
  end

  def show; end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id
    authorize @ticket
    if @ticket.save
      flash[:notice] = 'Ticket created successfully.'
      redirect_to tickets_path
    else
      render :new
    end
  end

  def edit
    authorize @ticket
  end

  def update
    authorize @ticket
    if @ticket.update(ticket_params)
      flash[:info] = 'Ticket Was Updated Successfully!'
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  def update_status
    authorize @ticket
    if params[:status].present? && [1, 2, 3, 4].include?(params[:status].to_i)
      @ticket.update(status: params[:status].to_i)
      redirect_to @ticket, notice: "Status changed to #{@ticket.status.capitalize}"
    else
      redirect_to @ticket, alert: 'Error changing status.'
    end
  end

  def destroy
    authorize @ticket
    @ticket.destroy
    flash[:notice] = 'Ticket Was Deleted Successfully!'
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :project_id, :description, :bug_type)
  end

  def set_ticket
    @ticket = Ticket.find_by_id(params[:id])
  end
end
