namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Heat.create!(level: "High")
    Heat.create!(level: "Medium")
    Heat.create!(level: "Normal")
    Heat.create!(level: "Low")
    Heat.create!(level: "Very Low")

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