json.name @user.name
json.email @user.email
json.progress @user.progress

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

has_video = @user.video.present?

json.video do 
  json.id has_video ? @video.id : nil
  json.user_id has_video ? @video.user_id : nil
  json.video_uuid has_video ? @video.video_uuid : nil
end

json.applications do 
  json.array!(@applications) do |application|
    json.id application.id
    json.user_id application.user_id
    json.job_id application.id
  end
end