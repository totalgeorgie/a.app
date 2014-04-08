json.name @user.name
json.email @user.email

json.common_app do
  json.id @common_app.id
  json.progress @common_app.progress
  json.user_id @user.id
  json.job_interest @common_app.job_interest
  json.china_goals @common_app.china_goals
  json.bonus_choice @common_app.bonus_choice
  json.china_time @common_app.china_time ? @common_app.china_time.to_s + ' years' : 'N/A'
  json.nationality @common_app.nationality ? @common_app.country_name : 'N/A'
  json.current_city @common_app.current_city ? @common_app.current_city : 'N/A'
  json.grad_year @common_app.grad_year ? @common_app.grad_year : 'N/A'
  json.ideal_salary @common_app.ideal_salary ? @common_app.ideal_salary : 'N/A'
  json.bonus_question @common_app.bonus_question
  json.cities @common_app.cities.try{ |cit| cit.any? ? '&rarr; ' + cit.map(&:name).join(', ') : 'No cities' }
  json.industries @common_app.industries.try{ |ind| ind.any? ? ind.map(&:name).join(', ') : nil }
  
  json.city_ids @common_app.city_ids.map(&:to_s)
  json.industry_ids @common_app.industry_ids.map(&:to_s)

  json.resume do 
    json.url @common_app.resume.url
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