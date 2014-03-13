class UserMailer < ActionMailer::Base
  default from: "abe@atlas-china.com"

  def password_reset(user)
    @user = user
    mail(to: user.email, subject: "Your Atlas China Password Reset Instructions")
  end    
end
