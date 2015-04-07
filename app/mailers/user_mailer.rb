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
          @url  = "https://app.mindimp.com/users/#{user.activation_token}/activate"
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
          @url  = "https://app.mindimp.com/login"
      else
          # Our dev & test URL
          @url  = "http://localhost:3000/login"
      end
    mail(:to => user.email,
       :subject => "Your MindImp account is now activated!")
  end


  def activation_admin_email(user)
    @user = user
    mail(:to => "iris@mindimp.com", 
         :cc => "maria@mindimp.com, jeff@mindimp.com",
         :subject => "#{@user.name} has registered for the site." )
  end

  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token)
    mail(:to => user.email,
         :subject => "Your MindImp password has been reset")
  end

  #emails that are related to assignments in courses
  def instructor_create_assignment_email(instructor, course_assignment)
    @course_assignment = course_assignment
    @instructor = instructor
    mail(:to => @instructor.email,
         :subject => "[#{@course_assignment.course_session.course.abbreviation}: #{@course_assignment.course_session.course_period.title}]: #{@course_assignment.title} (instructor confirmation)")
  end

  def create_assignment_email(user, course_assignment)
    @user = user
    @course_assignment = course_assignment
    mail(:to => user.email,
         :subject => "[#{@course_assignment.course_session.course.abbreviation}: #{@course_assignment.course_session.course_period.title}]: #{@course_assignment.title}", 
         :from => @course_assignment.course_session.instructor.email )
  end

  def submit_assignment_email(instructor, assignment_response)
    @instructor = instructor
    @assignment_response = assignment_response
    mail(:to => instructor.email, 
         :subject => "[#{@assignment_response.course_assignment.course_session.course.abbreviation}: #{@assignment_response.course_assignment.course_session.course_period.title}]: Response to #{@assignment_response.course_assignment.title} by #{@assignment_response.user.name}")
  end

  def grade_assignment_email(grader, assignment_response)
    @grader = grader
    @assignment_response = assignment_response
    mail(:to => @assignment_response.user.email, 
         :cc => @grader.email,
         :subject => "[#{@assignment_response.course_assignment.course_session.course.abbreviation}: #{@assignment_response.course_assignment.course_session.course_period.title}]: An assignment has been graded!")
  end


 #emails that are related to discussion questions

 def create_discussion_response_email(user, discussion_response)
  @discussion_response = discussion_response
  @user = user
  mail(:to => @user.email, 
       :subject => "#{@discussion_response.user.name} has added a response to a question for #{@discussion_response.discussion_question.source}")
 end

 def comment_discussion_response_email(user, comment_user, discussion_response)
  @user = user
  @comment_user = comment_user
  @discussion_response = discussion_response
  mail(:to => @user.email, 
       :cc => @comment_user.email, 
       :subject => "#{@comment_user.name} has added comments to your response for #{discussion_response.discussion_question.source}")
 end



end
