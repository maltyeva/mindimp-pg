class UserMailer < ActionMailer::Base
  default from: "info@mindimp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
        if Rails.env.production?
          @url  = "http://www.app.mindimp.com/users/#{user.activation_token}/activatelogin"
      else
          # Our dev & test URL
          @url  = "http://localhost:3000/users/#{user.activation_token}/activate"
      end
    mail(:to => user.email,
       :subject => "Welcome to MindImp!")

  end

  def activation_success_email(user)
    @user = user
    if Rails.env.production?
          @url  = "http://www.app.mindimp.com/login"
      else
          # Our dev & test URL
          @url  = "http://localhost:3000/login"
      end
    mail(:to => user.email,
       :subject => "Your account is now activated")
  end



  # email_with_name = %("#{@user.first_name}" <#{@user.email}>)
  # mail(to: email_with_name, 

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
end
