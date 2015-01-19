class UserMailer < ActionMailer::Base
  default from: "info@mindimp.com"


 def welcome_email(user)
    @user = user
    @url  = 'http://mindimp.com/login'
    email_with_name = %("#{@user.first_name}" <#{@user.email}>)
    mail(to: email_with_name, 
    	 subject: 'Welcome to your MindImp Account!')
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Please activate your MindImp account."
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end

end
