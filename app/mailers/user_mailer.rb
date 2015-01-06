class UserMailer < ActionMailer::Base
  default from: "info@mindimp.com"


 def welcome_email(user)
    @user = user
    @url  = 'http://mindimp.com/login'
    email_with_name = %("#{@user.first_name}" <#{@user.email}>)
    mail(to: email_with_name, 
    	 subject: 'Welcome to your MindImp Account!')
  end

end
