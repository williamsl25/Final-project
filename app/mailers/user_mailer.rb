class UserMailer < ApplicationMailer
  default from: 'notifications@localhost.com'

          
  def comment_email(user, comment)
    @user = user
    @comment = comment
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: "Comment Notification")
  end

  def student_user_comment_email(student, comment)
    @comment = comment
    @student = student
    mail(to: student.user.email, subject: "Student Comment Notification")
  end

  def program_user_comment_email(program, comment)
    @comment = comment
    @program = program
    mail(to: program.user.email, subject: "Program Comment Notification")
  end

end
