class UserMailer < ApplicationMailer
  def user_created(user)
    @user = user
    @url = ENV['SIGN_IN_URL']
    @site_url = ENV['BASE_URL']
    mail to: @user.email,
         subject: "Welcome #{@user.full_name} to the Bug Tracker Application."
  end
end
