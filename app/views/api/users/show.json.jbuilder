json.name @user.name
json.email @user.email

json.common_app do 
  json.id @common_app.id
  json.progress @common_app.progress
  json.user_id @user.id
  json.job_interest @common_app.job_interest
  json.china_goals @common_app.china_goals
  json.china_time @common_app.china_time(&:to_s)
  json.nationality @common_app.nationality
  json.current_city @common_app.current_city
  json.grad_year @common_app.grad_year
  json.salary_pref @common_app.salary_pref
  json.culture_pref @common_app.culture_pref
  json.china_contrib @common_app.china_contrib

  json.city_ids @common_app.city_ids.map(&:to_s)
  json.industry_ids @common_app.industry_ids.map(&:to_s)
  json.role_type_ids @common_app.role_type_ids.map(&:to_s)
  json.resume do 
    json.url @common_app.resume.url
  end
end

if @video
  json.video do 
    json.id @video.id
    json.user_id @video.user_id
    json.video_uuid @video.video_uuid
    json.question_choice @video.question_choice
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