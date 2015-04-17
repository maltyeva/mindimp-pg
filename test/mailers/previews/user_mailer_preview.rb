# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/activation_needed_email
  def activation_needed_email
    UserMailer.activation_needed_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/activation_success_email
  def activation_success_email
    UserMailer.activation_success_email
  end

  def create_discussion_response_email
  	UserMailer.create_discussion_response_email(User.first, DiscussionResponse.first)
  end
  
  def activation_needed_email
  	UserMailer.activation_needed_email(User.first)
  end

  def activation_success_email
  	UserMailer.activation_success_email(User.first)
  end

  def comment_discussion_response_email
  	UserMailer.comment_discussion_response_email(User.first, User.last, DiscussionResponse.first)
  end

  def create_assignment_email
  	UserMailer.create_assignment_email(User.first, CourseAssignment.first)
  end

  def grade_assignment_email
  	UserMailer.grade_assignment_email(User.first, AssignmentResponse.first)
  end

  def instructor_create_assignment_email
  	UserMailer.instructor_create_assignment_email(User.first, CourseAssignment.first)
  end

  def reset_password_email
  	UserMailer.reset_password_email(User.first)
  end

  def submit_assignment_email
  	UserMailer.submit_assignment_email(User.first, AssignmentResponse.first)
  end

 def activation_admin_email
  UserMailer.activation_admin_email(User.first)
 end

 def create_assessment_email
  UserMailer.create_assessment_email(User.first, Assessment.first)
 end

end
