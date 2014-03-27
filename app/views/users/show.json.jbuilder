json.name @user.name
json.email @user.email

json.common_app do 
  json.id @common_app.id
  json.progress @common_app.progress
  json.user_id @user.id
  json.nationality @common_app.nationality
  json.current_city @common_app.current_city
  json.grad_year @common_app.grad_year
  json.ideal_salary @common_app.ideal_salary
  json.bonus_question @common_app.bonus_question

  if @common_app.cities.length > 0
    json.cities do 
      json.array! @common_app.cities do |city|
        json.id city.id
        json.name city.name
      end
    end
  end

  if @common_app.industries.length > 0
    json.industries do 
      json.array! @common_app.industries do |industry|
        json.id industry.id
        json.name industry.name
      end
    end
  end
end

if @video
  json.video do 
    json.id @video.id
    json.user_id @video.user_id
    json.video_uuid @video.video_uuid
  end
end

if @applications.length > 0
  json.applications do 
    json.array! @applications do |application|
      json.id application.id
      json.user_id application.user_id
      json.job_id application.id
      json.job_title application.job.job_title
    end
  end
end