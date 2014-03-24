json.name @user.name
json.email @user.email

json.common_app do 
  json.id @common_app.id
  json.user_id @user.id
  json.nationality @common_app.nationality
  json.current_city @common_app.current_city
  json.grad_year @common_app.grad_year
  json.ideal_salary @common_app.ideal_salary
  json.chinese_ability @common_app.chinese_ability
  json.bonus_question @common_app.bonus_question
end

json.video do 
  json.id @user.video.id
  json.user_id @user.video.user_id
  json.video_uuid @video.video_uuid
end

json.jobs do 
  json.array!(@user.applications) do |application|
    json.name application.name
  end
end