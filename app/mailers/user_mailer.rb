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

  def company_start(params)
    @company_name = params[:company_name]
    @email = params[:email]
    @comment = params[:comment]

    mail(to: "abe@atlas-china.com", subject: "Company Inquiry from #{@company_name || @email}")
  end
end