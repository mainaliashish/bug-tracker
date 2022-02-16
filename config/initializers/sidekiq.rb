# config/initializers/sidekiq.rb
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6361/0'  }
  schedule_file = "config/schedule.yml"
  if File.exists?(schedule_file)
    puts "Using schedule"
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6361/0'  }
end