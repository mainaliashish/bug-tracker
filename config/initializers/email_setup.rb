Rails.application.configure do
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp  
  config.action_mailer.default_url_options = { :host => 'localhost', port: '3000' }
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'deviseapp.com',
    authentication: "plain",
    user_name: Rails.application.credentials.dig(:google_account, :email),
    password: Rails.application.credentials.dig(:google_account, :password),
    enable_starttls_auto: true,
  }
end