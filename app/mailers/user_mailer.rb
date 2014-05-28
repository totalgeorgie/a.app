class UserMailer < ActionMailer::Base
  default from: "abe@atlas-china.com"

  def password_reset(user)
    @user = user
    mail(to: user.email, subject: "Your Atlas China Password Reset Instructions")
  end
  
  def send_refer(referer, referee)
  	@referer = referer
  	mail(to: referee, cc: "abe@atlas-china.com", subject: "You've been refered to Atlas China")
  end
end