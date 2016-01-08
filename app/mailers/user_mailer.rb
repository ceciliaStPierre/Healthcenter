class UserMailer < ActionMailer::Base
   default from: 'noreply@healthdccuc.cl'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_notification.subject
  #
  def welcome_notification(user, password)
    @user = user
    @password = password
     mail(to: @user.email, subject: '¡Bienvenido!')
  end
end
