class UserMailer < ActionMailer::Base
  default from: "abe@atlas-china.com"

  def password_reset(user)
    @user = user
    mail(to: user.email, subject: "Your Atlas China Password Reset Instructions")
  end
  
  def send_refer(referer, referee)
    @referer = referer
    mail(
      to: referee,
      cc: "abe@atlas-china.com",
      subject: "You've been refered to Atlas China"
    )
  end

  def company_start(params)
    @company_name = params[:company_name]
    @email = params[:email]
    @comment = params[:comment]

    mail(
      to: "abe@atlas-china.com",
      subject: "Company Inquiry from #{@company_name || @email}"
    )
  end

  def weekly_digest
    @sourced_length = User.sourced.length
    @users = User.proactive.where('users.created_at > ?', 1.week.ago)
    
    if @users.length > 1
      mail(
        to: "abe@atlas-china.com",
        cc: "stepan.p@gmail.com",
        subject: "#{@users.length} New Applicants | Your Weekly Atlas China Digest For #{DateTime.now.strftime("%m/%d/%Y")}"
      )
    end
  end

  def tell_admin_about(user)
    @user = user
    mail(
      to: "abe@atlas-china.com",
      cc: "stepan.p@gmail.com",
      subjet: "#{@user.name} signed up for Atlas China"
    )
  end
end