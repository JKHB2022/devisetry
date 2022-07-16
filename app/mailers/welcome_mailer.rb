class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.send_greetings_notification.subject
  #
  def send_greetings_notification(user)
    @user = user

    mail to: @user.email, subject: "Thanks you for signing up"
  end

  def test_send(email)
    @email = email
    mail(to: @email, subject: 'Test Send')
  end
  
end
