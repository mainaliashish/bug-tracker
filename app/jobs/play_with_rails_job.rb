class PlayWithRailsJob < ApplicationJob
  queue_as :default

  def perform(*)
    puts 'Hello from the Active Job... I will be called after 2 minutes. 😋'
  end
end
