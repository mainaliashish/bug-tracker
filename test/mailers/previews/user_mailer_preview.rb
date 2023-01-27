# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/user_created
  def user_created
    user = User.first
    UserMailer.user_created(user)
  end
end
