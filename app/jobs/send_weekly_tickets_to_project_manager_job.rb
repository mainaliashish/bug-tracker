class SendWeeklyTicketsToProjectManagerJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 0

  def perform(*_args)
    project_managers = User.all_project_manager
    SendWeeklyTicket.new(project_managers).mail_project_managers
  end
end
