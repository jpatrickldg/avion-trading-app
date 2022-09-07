class ActivateUserMailer < ApplicationMailer
  def activate
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
