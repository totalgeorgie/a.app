desc 'Send weekly digest to abe'

task send_weekly_email: :environment do
  UserMailer.weekly_digest.deliver # if Time.now.saturday?
end