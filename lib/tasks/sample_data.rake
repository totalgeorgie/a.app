namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@atlas-china.coom",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    50.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@atlasmail.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end