namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    Heat.create!(level: "High")
    Heat.create!(level: "Medium")
    Heat.create!(level: "Normal")
    Heat.create!(level: "Low")
    Heat.create!(level: "Very Low")
    
    Source.create!(from: "Referral")
    Source.create!(from: "Site")

    Industry.create!(name:'Agriculture')
    Industry.create!(name:'Architecture')
    Industry.create!(name:'Education')
    Industry.create!(name:'Events')
    Industry.create!(name:'Fashion')
    Industry.create!(name:'Healthcare')
    Industry.create!(name:'Hospitality')
    Industry.create!(name:'Investment')
    Industry.create!(name:'Legal')
    Industry.create!(name:'Marketing')
    Industry.create!(name:'Media')
    Industry.create!(name:'Sales')
    Industry.create!(name:'Real Estate')
    Industry.create!(name:'Technology')
    
    City.create!(name: 'Beijing')
    City.create!(name: 'Changsha')
    City.create!(name: 'Chengdu')
    City.create!(name: 'Dalian')
    City.create!(name: 'Hangzhou')
    City.create!(name: 'Hong Kong')
    City.create!(name: 'Shanghai')
    City.create!(name: 'Tianjin')
    City.create!(name: 'Wuhan')
    City.create!(name: 'Wux')

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