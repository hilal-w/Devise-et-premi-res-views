# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def user_created_compte
    UserMailer.user_created_compte(User.first)
  end
  def event_participe
    UserMailer.event_participe(Attendance.first)
  end
end
