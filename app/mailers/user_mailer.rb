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
          @url  = "https://dry-citadel-6111.herokuapp.com/users/#{user.activation_token}/activate"
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
          @url  = "https://dry-citadel-6111.herokuapp.com/login"
      else
          # Our dev & test URL
          @url  = "http://localhost:3000/login"
      end
    mail(:to => user.email,
       :subject => "Your MindImp account is now activated!")
  end


  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token)
    mail(:to => user.email,
         :subject => "Your password has been reset")
  end


end
