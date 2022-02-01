class UserMailer < ApplicationMailer
  def user_created(user)
    @user = user
    @url = 'http://localhost:3000/users/sign_in'
    @site_url = 'http://localhost:3000/'
    mail to: @user.email,
         subject: "Welcome #{@user.full_name} to the Bug Tracker Application."
  end
end
