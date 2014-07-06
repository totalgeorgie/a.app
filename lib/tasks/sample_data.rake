namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    Industry.create!(name: 'Sales')
    Industry.create!(name: 'Business Development')
    Industry.create!(name: 'Media')
    Industry.create!(name: 'Operations')
    Industry.create!(name: 'Customer Development')
    Industry.create!(name: 'Marketing')
    Industry.create!(name: 'Customer Service')
    
    City.create!(name: 'Beijing')
    City.create!(name: 'Changsha')
    City.create!(name: 'Chengdu')
    City.create!(name: 'Dalian')
    City.create!(name: 'Hangzhou')
    City.create!(name: 'Hong Kong')
    City.create!(name: 'Shanghai')
    City.create!(name: 'Tianjin')
    City.create!(name: 'Wuhan')
    City.create!(name: 'Wuxi')

    User.create!(name: "Example User",
     email: "example@atlas-china.com",
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