class ApplicationMailer < ActionMailer::Base
  default from: 'bug-tracker@admin.com'
  layout 'mailer'
end
