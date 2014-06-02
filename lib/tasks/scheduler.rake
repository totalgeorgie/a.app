desc 'Send weekly digest to abe'

task :send_weekly_email do
  UserMailer.weekly_digest.deliver if Time.now.sunday?
end