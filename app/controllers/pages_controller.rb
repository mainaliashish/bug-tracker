class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[homepage contact create_contact]

  def homepage
    @projects = Project.recent_five_projects
    @tickets = Ticket.recent_five_tickets
    @fixed_tickets = Ticket.recent_five_fixed_tickets
  end

  def dashboard
    id = current_user.id
    role = current_user.role.identifier
    results = helpers.switch_dashboard(id, role)
    role == 'project_manager' ? @projects = results : @tickets = results
  end

  def contact
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "We have received your message #{contact_params[:name]},
                        we will reach you shortly."
      redirect_to root_path
    else
      render :contact
    end
  end

  private

  def contact_params
    attributes = %i[name email message]
    params.require(:contact).permit(attributes)
  end
end
