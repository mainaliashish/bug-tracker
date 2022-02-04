# config/initializers/sidekiq.rb
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6361/0'  }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6361/0'  }
end